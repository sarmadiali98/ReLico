#!/usr/bin/env python3

"""
ReLico user-facing workflow.

A single reviewer-facing entry point for a user who has a Timed Rebeca (DTR)
model and does not want to learn the internal repository layout. It wraps the
existing, verified pipeline stages -- it adds no pipeline logic and no new
semantics of its own.

The stages it orchestrates all live in tools/relico_bench_stage.py, the same
implementations the benchmark corpus and the reproduction script drive:

  parse         parser-json  --family general   (Rebeca -> general-v1 JSON)
  decode        lean-export  --mode decoded-dtr-ast
  model-check   rmc                              (Timed Rebeca model checking)
  translate     lean-export  --mode translated-lf-ast + lf-source
  compile       lfc                              (generated LF -> native binary)
  run           runtime                          (execute the generated binary)

Tool locations (java, maven, lake, lfc, the RMC jar and parser archive) are
resolved by the pipeline's own resolve_tool_variables(), so RELICO_* overrides
and the ~/.cache/relico layout behave exactly as they do for the benchmarks.

Two subcommands:

  relico analyze <model.rebeca>
      Accept the model, report the supported fragment, and validate priorities.
      Parses and decodes only; no external model checking or compilation.

  relico run <model.rebeca>
      The full workflow: analyze, then DTR model checking, translation to LF,
      LF compilation, and a short runtime smoke, ending in a clear report and a
      machine-readable report.json.

Nothing is written into the repository. All artifacts land under an output
directory (default: a fresh /tmp/relico-workflow.<timestamp>/), including the
generated LF source and report.json.
"""

from __future__ import annotations

import argparse
import datetime
import json
import os
import subprocess
import sys
import time
from dataclasses import dataclass, field
from hashlib import sha256
from pathlib import Path

# The workflow lives beside the pipeline stages it wraps and reuses the
# pipeline's own tool resolution, so a user gets identical tool discovery.
TOOLS_DIR = Path(__file__).resolve().parent
REPO_ROOT = TOOLS_DIR.parent
STAGE_SCRIPT = TOOLS_DIR / "relico_bench_stage.py"

if str(TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR))

from relico_bench_execution import resolve_tool_variables  # noqa: E402


# The generated-program identity the lfc stage uses; kept in sync by importing
# rather than restating it.
try:
    from relico_bench_stage import TRANSLATED_PROGRAM
except Exception:  # pragma: no cover - defensive; the constant is stable
    TRANSLATED_PROGRAM = "TranslatedLFProgram"


def read_version() -> str:
    """Best-effort ReLico version from lakefile.toml; 'unknown' if unreadable."""
    lakefile = REPO_ROOT / "lakefile.toml"
    try:
        for line in lakefile.read_text(encoding="utf-8").splitlines():
            stripped = line.strip()
            if stripped.startswith("version"):
                return stripped.split("=", 1)[1].strip().strip('"')
    except OSError:
        pass
    return "unknown"


# The construct-level boundaries of the ReLico supported (general) fragment.
# These are the things a Timed Rebeca model may use that the verified pipeline
# does not accept. They are reported so a user sees what "supported fragment"
# means rather than only a bare PASS. The detector confirms each is absent from
# an accepted model; when the model is rejected, the decoder diagnostic names
# the precise offending construct instead.
FRAGMENT_BOUNDARIES = (
    "dynamic actor creation",
    "unbounded / unspecified message-queue growth",
    "non-constant (data-dependent) time delays",
    "external / environment actions outside the model",
    "non-integer, non-boolean state (records, arrays, references)",
)


class WorkflowError(RuntimeError):
    pass


@dataclass
class StageOutcome:
    name: str
    status: str  # "pass" | "fail" | "skipped"
    detail: str = ""
    duration_ms: int = 0
    log_path: str | None = None
    data: dict = field(default_factory=dict)

    @property
    def ok(self) -> bool:
        return self.status == "pass"


def now_iso() -> str:
    return datetime.datetime.now(datetime.timezone.utc).strftime(
        "%Y-%m-%dT%H:%M:%SZ"
    )


def sha256_file(path: Path) -> str:
    digest = sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def run_stage_command(
    command: list[str],
    *,
    log_path: Path,
    timeout: int,
) -> tuple[int, str, int]:
    """Run one pipeline stage, tee its output to a log, return (code, tail, ms)."""
    log_path.parent.mkdir(parents=True, exist_ok=True)
    start = time.monotonic()
    try:
        completed = subprocess.run(
            command,
            cwd=REPO_ROOT,
            text=True,
            capture_output=True,
            timeout=timeout,
            check=False,
        )
        output = (completed.stdout or "") + (completed.stderr or "")
        exit_code = completed.returncode
    except subprocess.TimeoutExpired as error:
        output = (
            (error.stdout or "")
            if isinstance(error.stdout, str)
            else ""
        ) + f"\nSTAGE_TIMEOUT_SECONDS={timeout}\n"
        exit_code = 124
    duration_ms = round((time.monotonic() - start) * 1000)
    log_path.write_text(output, encoding="utf-8")
    tail = "\n".join(output.strip().splitlines()[-8:])
    return exit_code, tail, duration_ms


# The lines that carry a real rejection reason, in preference order. The parser
# bridge and the Lean layers each stamp their diagnostics, and those lines are
# far more useful to a user than a Maven or Lake stack-trace tail.
DIAGNOSTIC_MARKERS = (
    "unsupported by the ReLico general parser bridge",
    "Timed Rebeca parsing or semantic checking failed",
    "general artifact decode failed",
    "verified general translation failed",
    "general LF rendering failed",
    "general-v1:",
)


def meaningful_diagnostic(log_path: Path, fallback: str) -> str:
    """Pull the layer-stamped rejection reason from a stage log, else fallback."""
    try:
        text = log_path.read_text(encoding="utf-8")
    except OSError:
        return fallback
    hits: list[str] = []
    for line in text.splitlines():
        for marker in DIAGNOSTIC_MARKERS:
            if marker in line:
                # Trim a leading Maven "[ERROR] ... Java class." preamble so the
                # marker starts the reported line.
                index = line.find(marker)
                cleaned = line[index:].strip()
                # Drop a trailing Maven "-> [Help N]" pointer.
                marker_help = cleaned.rfind(" -> [Help")
                if marker_help != -1:
                    cleaned = cleaned[:marker_help].strip()
                hits.append(cleaned)
                break
    if hits:
        # De-duplicate while preserving order.
        seen: set[str] = set()
        unique = [h for h in hits if not (h in seen or seen.add(h))]
        return "\n".join(unique[:4])
    return fallback


# --------------------------------------------------------------------------
# Supported-fragment detection (derived from the parser-json document).
# --------------------------------------------------------------------------


def detect_constructs(model: dict) -> list[dict]:
    """Derive the 'Detected' checklist from a general-v1 parser document."""
    classes = model.get("classes", []) or []
    instances = model.get("instances", []) or []

    has_actors = bool(classes)
    has_message_servers = any(
        cls.get("messageServers") for cls in classes
    )
    has_primitive_state = any(
        cls.get("stateVariables") for cls in classes
    )

    # Walk the tree once to note delays, sends, and control-flow shape.
    kinds: set[str] = set()
    after_delays = 0

    def walk(node: object) -> None:
        nonlocal after_delays
        if isinstance(node, dict):
            kind = node.get("kind")
            if isinstance(kind, str):
                kinds.add(kind)
            if node.get("after") not in (None,):
                after_delays += 1
            for value in node.values():
                walk(value)
        elif isinstance(node, list):
            for value in node:
                walk(value)

    walk(model)

    has_delays = after_delays > 0
    has_message_passing = "send" in kinds
    has_priorities = any(
        cls_ms.get("priority") is not None
        for cls in classes
        for cls_ms in (cls.get("messageServers") or [])
    ) or any(inst.get("priority") is not None for inst in instances)

    return [
        {"construct": "actors (reactive classes)", "present": has_actors},
        {"construct": "message servers", "present": has_message_servers},
        {
            "construct": "primitive state (int / boolean)",
            "present": has_primitive_state,
        },
        {"construct": "asynchronous message passing", "present": has_message_passing},
        {"construct": "deterministic (constant) delays", "present": has_delays},
        {"construct": "priority annotations", "present": has_priorities},
    ]


# --------------------------------------------------------------------------
# Priority handling (read straight from the parser-json document).
# --------------------------------------------------------------------------


def collect_priorities(model: dict) -> dict:
    """
    Report the two priority levels the verified sort normalizes:

      message server order  -- per class, message servers ordered by @priority
      actor routing order   -- main-block instances ordered by @priority

    An absent priority is reported as null and, per the verified convention
    (DTR/GeneralPriority.lean), sorts after every explicit priority; ties keep
    source declaration order. This function only reports the normalization; the
    decode stage is what actually enforces model well-formedness.
    """
    classes = model.get("classes", []) or []
    instances = model.get("instances", []) or []

    # Sort key: explicit priorities first (ascending), absent last, then the
    # declaration index to make ties stable and match the Lean normalization.
    def priority_key(priority, declaration_index):
        absent = priority is None
        return (1 if absent else 0, priority if not absent else 0, declaration_index)

    message_server_order = []
    for cls in classes:
        servers = cls.get("messageServers") or []
        ordered = sorted(
            (
                {
                    "class": cls.get("name"),
                    "message_server": server.get("name"),
                    "priority": server.get("priority"),
                    "declaration_index": index,
                }
                for index, server in enumerate(servers)
            ),
            key=lambda row: priority_key(
                row["priority"], row["declaration_index"]
            ),
        )
        message_server_order.extend(ordered)

    actor_routing_order = sorted(
        (
            {
                "instance": instance.get("name"),
                "class": instance.get("className"),
                "priority": instance.get("priority"),
                "declaration_index": index,
            }
            for index, instance in enumerate(instances)
        ),
        key=lambda row: priority_key(row["priority"], row["declaration_index"]),
    )

    # A light, informational validation: flag negative priorities (the exporter
    # already rejects those, so this is belt-and-suspenders) and note absences.
    issues: list[str] = []
    for row in message_server_order + actor_routing_order:
        priority = row["priority"]
        if isinstance(priority, int) and priority < 0:
            issues.append(
                f"negative priority {priority} on {row.get('message_server') or row.get('instance')}"
            )

    return {
        "message_server_order": message_server_order,
        "actor_routing_order": actor_routing_order,
        "issues": issues,
    }


# --------------------------------------------------------------------------
# The workflow itself.
# --------------------------------------------------------------------------


class Workflow:
    def __init__(
        self,
        *,
        model_path: Path,
        out_dir: Path,
        command: str,
        run_model_check: bool,
        run_runtime: bool,
    ) -> None:
        self.model_path = model_path
        self.out_dir = out_dir
        self.command = command
        self.run_model_check = run_model_check
        self.run_runtime = run_runtime

        self.work = out_dir / "work"
        self.logs = out_dir / "logs"
        self.tools = resolve_tool_variables()
        self.stages: list[StageOutcome] = []
        self.report: dict = {}
        self.started_at = now_iso()

    # -- small helpers ----------------------------------------------------

    def _stage_log(self, name: str) -> Path:
        return self.logs / f"{name}.log"

    def _require_tool(self, key: str, human: str) -> str:
        value = self.tools.get(key, "")
        if not value or not Path(value).exists():
            raise WorkflowError(
                f"required tool not found: {human} "
                f"(resolved as {value!r}); "
                "install it or set the matching RELICO_* variable"
            )
        return value

    def _python(self) -> str:
        return self.tools.get("python") or sys.executable

    def _stage_cmd(self, *args: str) -> list[str]:
        return [self._python(), str(STAGE_SCRIPT), *args]

    # -- individual pipeline steps ---------------------------------------

    def accept(self) -> StageOutcome:
        if not self.model_path.is_file():
            raise WorkflowError(f"model file not found: {self.model_path}")
        if self.model_path.suffix != ".rebeca":
            raise WorkflowError(
                f"expected a .rebeca model, got: {self.model_path.name}"
            )
        digest = sha256_file(self.model_path)
        outcome = StageOutcome(
            name="accept",
            status="pass",
            detail=f"sha256={digest[:16]}…",
            data={
                "name": self.model_path.name,
                "path": str(self.model_path),
                "sha256": digest,
                "size_bytes": self.model_path.stat().st_size,
            },
        )
        self.stages.append(outcome)
        return outcome

    def parse(self) -> StageOutcome:
        repo = str(REPO_ROOT)
        parser_artifact = self._require_tool(
            "parser_artifact", "Rebeca parser archive"
        )
        maven = self._require_tool("maven", "Apache Maven (mvn)")
        output = self.work / "parser-json" / "model.json"
        command = self._stage_cmd(
            "parser-json",
            "--family",
            "general",
            "--repo",
            repo,
            "--source",
            str(self.model_path),
            "--actual",
            str(self.work),
            "--artifact-zip",
            parser_artifact,
            "--maven",
            maven,
            "--output",
            str(output),
        )
        code, tail, ms = run_stage_command(
            command, log_path=self._stage_log("parse"), timeout=600
        )
        status = "pass" if code == 0 and output.is_file() else "fail"
        outcome = StageOutcome(
            name="parse",
            status=status,
            detail=""
            if status == "pass"
            else meaningful_diagnostic(self._stage_log("parse"), tail),
            duration_ms=ms,
            log_path=str(self._stage_log("parse")),
            data={"parser_json": str(output) if output.is_file() else None},
        )
        self.stages.append(outcome)
        return outcome

    def decode(self) -> StageOutcome:
        lake = self._require_tool("lake", "Lake (Lean build tool)")
        parser_json = self.work / "parser-json" / "model.json"
        output = self.work / "decoded-dtr-ast" / "model.txt"
        command = self._stage_cmd(
            "lean-export",
            "--family",
            "general",
            "--mode",
            "decoded-dtr-ast",
            "--repo",
            str(REPO_ROOT),
            "--lake",
            lake,
            "--input",
            str(parser_json),
            "--output",
            str(output),
        )
        code, tail, ms = run_stage_command(
            command, log_path=self._stage_log("decode"), timeout=600
        )
        status = "pass" if code == 0 and output.is_file() else "fail"
        outcome = StageOutcome(
            name="decode",
            status=status,
            detail=""
            if status == "pass"
            else meaningful_diagnostic(self._stage_log("decode"), tail),
            duration_ms=ms,
            log_path=str(self._stage_log("decode")),
            data={"decoded_ast": str(output) if output.is_file() else None},
        )
        self.stages.append(outcome)
        return outcome

    def model_check(self) -> StageOutcome:
        rmc_jar = self._require_tool("rmc_jar", "RMC 2.14 jar")
        java = self._require_tool("java", "Java runtime")
        cxx = self._require_tool("cxx", "C++ compiler (clang++/g++)")
        output = self.work / "rmc" / "verdict.json"
        command = self._stage_cmd(
            "rmc",
            "--source",
            str(self.model_path),
            "--actual",
            str(self.work),
            "--rmc-jar",
            rmc_jar,
            "--java",
            java,
            "--cxx",
            cxx,
            "--output",
            str(output),
        )
        code, tail, ms = run_stage_command(
            command, log_path=self._stage_log("model-check"), timeout=900
        )
        verdict = {}
        if output.is_file():
            try:
                verdict = json.loads(output.read_text(encoding="utf-8"))
            except (OSError, json.JSONDecodeError):
                verdict = {}
        status = "pass" if code == 0 and output.is_file() else "fail"
        detail = (
            f"{verdict.get('checked_property', '?')} = "
            f"{verdict.get('result', '?')}"
            if status == "pass"
            else tail
        )
        outcome = StageOutcome(
            name="model-check",
            status=status,
            detail=detail,
            duration_ms=ms,
            log_path=str(self._stage_log("model-check")),
            data=verdict,
        )
        self.stages.append(outcome)
        return outcome

    def translate(self) -> StageOutcome:
        lake = self._require_tool("lake", "Lake (Lean build tool)")
        parser_json = self.work / "parser-json" / "model.json"
        ast_output = self.work / "translated-lf-ast" / "program.txt"
        lf_output = self.work / "lf-source" / f"{TRANSLATED_PROGRAM}.lf"

        # translated-lf-ast: the verified compiler's program value.
        ast_cmd = self._stage_cmd(
            "lean-export",
            "--family",
            "general",
            "--mode",
            "translated-lf-ast",
            "--repo",
            str(REPO_ROOT),
            "--lake",
            lake,
            "--input",
            str(parser_json),
            "--output",
            str(ast_output),
        )
        code_ast, tail_ast, ms_ast = run_stage_command(
            ast_cmd, log_path=self._stage_log("translate-ast"), timeout=600
        )

        # lf-source: the rendered LF/C++ source file.
        src_cmd = self._stage_cmd(
            "lean-export",
            "--family",
            "general",
            "--mode",
            "lf-source",
            "--repo",
            str(REPO_ROOT),
            "--lake",
            lake,
            "--input",
            str(parser_json),
            "--output",
            str(lf_output),
        )
        code_src, tail_src, ms_src = run_stage_command(
            src_cmd, log_path=self._stage_log("translate-lf"), timeout=600
        )

        ok = (
            code_ast == 0
            and code_src == 0
            and ast_output.is_file()
            and lf_output.is_file()
        )

        published_lf = None
        if lf_output.is_file():
            # Publish a user-friendly copy named after the model, alongside the
            # canonical TranslatedLFProgram.lf the compiler stage expects.
            published_lf = self.out_dir / f"{self.model_path.stem}.lf"
            published_lf.write_text(
                lf_output.read_text(encoding="utf-8"), encoding="utf-8"
            )

        outcome = StageOutcome(
            name="translate",
            status="pass" if ok else "fail",
            detail=""
            if ok
            else meaningful_diagnostic(
                self._stage_log("translate-lf"),
                meaningful_diagnostic(
                    self._stage_log("translate-ast"), tail_src or tail_ast
                ),
            ),
            duration_ms=ms_ast + ms_src,
            log_path=str(self._stage_log("translate-lf")),
            data={
                "translated_ast": str(ast_output) if ast_output.is_file() else None,
                "lf_source": str(lf_output) if lf_output.is_file() else None,
                "published_lf": str(published_lf) if published_lf else None,
            },
        )
        self.stages.append(outcome)
        return outcome

    def compile_lf(self) -> StageOutcome:
        lfc = self._require_tool("lfc", "Lingua Franca compiler (lfc)")
        lf_source = self.work / "lf-source" / f"{TRANSLATED_PROGRAM}.lf"
        output = self.work / "lfc" / "result.json"
        command = self._stage_cmd(
            "lfc",
            "--lf-source",
            str(lf_source),
            "--work-directory",
            str(self.work / "work" / "lfc"),
            "--lfc",
            lfc,
            "--output",
            str(output),
        )
        code, tail, ms = run_stage_command(
            command, log_path=self._stage_log("compile"), timeout=1200
        )
        result = {}
        if output.is_file():
            try:
                result = json.loads(output.read_text(encoding="utf-8"))
            except (OSError, json.JSONDecodeError):
                result = {}
        status = "pass" if code == 0 and output.is_file() else "fail"
        outcome = StageOutcome(
            name="compile",
            status=status,
            detail=result.get("compiler", "") if status == "pass" else tail,
            duration_ms=ms,
            log_path=str(self._stage_log("compile")),
            data=result,
        )
        self.stages.append(outcome)
        return outcome

    def runtime(self) -> StageOutcome:
        executable = (
            self.work / "work" / "lfc" / "bin" / TRANSLATED_PROGRAM
        )
        output = self.work / "runtime" / "result.json"
        command = self._stage_cmd(
            "runtime",
            "--executable",
            str(executable),
            "--output",
            str(output),
        )
        code, tail, ms = run_stage_command(
            command, log_path=self._stage_log("runtime"), timeout=120
        )
        status = "pass" if code == 0 and output.is_file() else "fail"
        outcome = StageOutcome(
            name="runtime",
            status=status,
            detail="" if status == "pass" else tail,
            duration_ms=ms,
            log_path=str(self._stage_log("runtime")),
        )
        self.stages.append(outcome)
        return outcome

    # -- orchestration ----------------------------------------------------

    def execute(self) -> dict:
        self.out_dir.mkdir(parents=True, exist_ok=True)

        accept = self.accept()

        parse = self.parse()
        parser_model: dict = {}
        if parse.ok:
            try:
                parser_model = json.loads(
                    (self.work / "parser-json" / "model.json").read_text(
                        encoding="utf-8"
                    )
                )
            except (OSError, json.JSONDecodeError):
                parser_model = {}

        decode = self.decode() if parse.ok else StageOutcome(
            "decode", "skipped", "parse did not produce a document"
        )
        if not parse.ok:
            self.stages.append(decode)

        supported = parse.ok and decode.ok

        # Supported-fragment section.
        if supported:
            detected = detect_constructs(parser_model)
            unsupported_present: list[dict] = []
            fragment_status = "PASS"
        else:
            detected = (
                detect_constructs(parser_model) if parser_model else []
            )
            # The failing stage's log carries the precise diagnostic.
            failing = parse if not parse.ok else decode
            unsupported_present = [
                {
                    "stage": failing.name,
                    "diagnostic": failing.detail,
                }
            ]
            fragment_status = "FAIL"

        # Priority section (only meaningful once a document exists).
        if parser_model:
            priorities = collect_priorities(parser_model)
            priority_status = (
                "PASS"
                if supported and not priorities["issues"]
                else ("FAIL" if priorities["issues"] else "PARTIAL")
            )
        else:
            priorities = {
                "message_server_order": [],
                "actor_routing_order": [],
                "issues": [],
            }
            priority_status = "SKIPPED"

        model_check_outcome: StageOutcome | None = None
        translate_outcome: StageOutcome | None = None
        compile_outcome: StageOutcome | None = None
        runtime_outcome: StageOutcome | None = None

        if self.command == "run" and supported:
            if self.run_model_check:
                model_check_outcome = self.model_check()
            translate_outcome = self.translate()
            if translate_outcome.ok:
                compile_outcome = self.compile_lf()
                if compile_outcome.ok and self.run_runtime:
                    runtime_outcome = self.runtime()

        self.report = self._build_report(
            accept=accept,
            fragment_status=fragment_status,
            detected=detected,
            unsupported_present=unsupported_present,
            priorities=priorities,
            priority_status=priority_status,
            model_check=model_check_outcome,
            translate=translate_outcome,
            compile_lf=compile_outcome,
            runtime=runtime_outcome,
        )

        report_path = self.out_dir / "report.json"
        report_path.write_text(
            json.dumps(self.report, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        self.report["_report_path"] = str(report_path)
        return self.report

    def _build_report(
        self,
        *,
        accept: StageOutcome,
        fragment_status: str,
        detected: list[dict],
        unsupported_present: list[dict],
        priorities: dict,
        priority_status: str,
        model_check: StageOutcome | None,
        translate: StageOutcome | None,
        compile_lf: StageOutcome | None,
        runtime: StageOutcome | None,
    ) -> dict:
        def section(outcome: StageOutcome | None) -> dict:
            if outcome is None:
                return {"status": "SKIPPED"}
            return {
                "status": outcome.status.upper(),
                "detail": outcome.detail,
                "duration_ms": outcome.duration_ms,
                "data": outcome.data,
            }

        # Overall verdict: A = full success, B = analysis good but a downstream
        # stage failed or was skipped, C = the model is outside the fragment.
        if fragment_status != "PASS":
            verdict = "C"
        else:
            downstream = [
                outcome
                for outcome in (model_check, translate, compile_lf, runtime)
                if outcome is not None
            ]
            if self.command == "analyze":
                verdict = "A"
            elif all(outcome.ok for outcome in downstream) and downstream:
                verdict = "A"
            else:
                verdict = "B"

        return {
            "tool": "relico-workflow",
            "schema_version": 1,
            "relico_version": read_version(),
            "command": self.command,
            "started_at": self.started_at,
            "finished_at": now_iso(),
            "output_directory": str(self.out_dir),
            "model": accept.data,
            "supported_fragment": {
                "status": fragment_status,
                "detected": detected,
                "unsupported_present": unsupported_present,
                "fragment_boundaries": list(FRAGMENT_BOUNDARIES),
            },
            "priorities": {
                "status": priority_status,
                "message_server_order": priorities["message_server_order"],
                "actor_routing_order": priorities["actor_routing_order"],
                "issues": priorities["issues"],
            },
            "model_checking": section(model_check),
            "translation": section(translate),
            "lf_compilation": section(compile_lf),
            "runtime": section(runtime),
            "verdict": verdict,
            "stages": [
                {
                    "name": stage.name,
                    "status": stage.status,
                    "detail": stage.detail,
                    "duration_ms": stage.duration_ms,
                    "log": stage.log_path,
                }
                for stage in self.stages
            ],
        }


# --------------------------------------------------------------------------
# Human-readable rendering.
# --------------------------------------------------------------------------


def render_report(report: dict) -> str:
    check = "\u2713"
    cross = "\u2717"
    lines: list[str] = []
    add = lines.append

    add("ReLico Analysis")
    add("")
    add("Model:")
    add(f"  {report['model'].get('name', '?')}")
    add("")

    fragment = report["supported_fragment"]
    add("Supported fragment:")
    add(f"  {fragment['status']}")
    add("")
    add("Detected:")
    for entry in fragment["detected"]:
        mark = check if entry["present"] else cross
        add(f"  {mark} {entry['construct']}")
    if not fragment["detected"]:
        add("  (no document produced)")
    add("")

    if fragment["unsupported_present"]:
        add("Rejected construct:")
        for entry in fragment["unsupported_present"]:
            add(f"  {cross} at {entry['stage']} stage")
            for line in (entry.get("diagnostic") or "").splitlines():
                add(f"      {line}")
        add("")

    add("Outside the supported fragment (must be absent):")
    for boundary in fragment["fragment_boundaries"]:
        add(f"  {cross} {boundary}")
    add("")

    priorities = report["priorities"]
    add("Priority validation:")
    add(f"  {priorities['status']}")
    if priorities["message_server_order"]:
        add("")
        add("Applied normalization:")
        add("  message server order:")
        current_class = None
        for row in priorities["message_server_order"]:
            if row["class"] != current_class:
                current_class = row["class"]
                add(f"    {current_class}:")
            priority = row["priority"]
            shown = "(none)" if priority is None else f"@priority({priority})"
            add(f"      {shown} {row['message_server']}")
        add("  actor routing order:")
        for row in priorities["actor_routing_order"]:
            priority = row["priority"]
            shown = "(none)" if priority is None else f"@priority({priority})"
            add(f"    {shown} {row['instance']} : {row['class']}")
    if priorities["issues"]:
        add("")
        add("Priority issues:")
        for issue in priorities["issues"]:
            add(f"  {cross} {issue}")
    add("")

    def status_block(title: str, section: dict, extra: str = "") -> None:
        status = section.get("status", "SKIPPED")
        add(f"{title}:")
        line = f"  {status}"
        if extra and status not in {"SKIPPED"}:
            line += f"  {extra}"
        add(line)
        detail = section.get("detail", "")
        if status not in {"PASS", "SKIPPED"} and detail:
            for detail_line in detail.splitlines()[-4:]:
                add(f"      {detail_line}")
        add("")

    if report["command"] == "run":
        mc = report["model_checking"]
        status_block(
            "DTR Model Checking",
            mc,
            extra=mc.get("detail", "") if mc.get("status") == "PASS" else "",
        )
        status_block("Translation", report["translation"])

        lf_path = report["translation"].get("data", {}).get("published_lf")
        if lf_path:
            add("Generated LF:")
            add(f"  {lf_path}")
            add("")

        status_block(
            "LF Compilation",
            report["lf_compilation"],
            extra=report["lf_compilation"].get("data", {}).get("compiler", ""),
        )
        if report["runtime"].get("status") != "SKIPPED":
            status_block("Runtime", report["runtime"])

    add(f"Verdict: {report['verdict']}")
    add("")
    add(f"Report: {report.get('_report_path', report['output_directory'] + '/report.json')}")
    return "\n".join(lines)


# --------------------------------------------------------------------------
# CLI.
# --------------------------------------------------------------------------


def build_arg_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="relico",
        description=(
            "Analyze and run a Timed Rebeca (DTR) model through the verified "
            "ReLico pipeline: fragment check, priority validation, model "
            "checking, translation to Lingua Franca, and LF compilation."
        ),
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    def add_common(subparser: argparse.ArgumentParser) -> None:
        subparser.add_argument(
            "model",
            help="path to the Timed Rebeca model (.rebeca)",
        )
        subparser.add_argument(
            "--out",
            metavar="DIR",
            default=None,
            help=(
                "output directory for artifacts and report.json "
                "(default: a fresh /tmp/relico-workflow.<timestamp>/)"
            ),
        )
        subparser.add_argument(
            "--json",
            action="store_true",
            help="print report.json to stdout instead of the human report",
        )

    analyze = subparsers.add_parser(
        "analyze",
        help="fragment check + priority validation (parse and decode only)",
    )
    add_common(analyze)

    run = subparsers.add_parser(
        "run",
        help="the full workflow through model checking, translation, and compilation",
    )
    add_common(run)
    run.add_argument(
        "--skip-model-check",
        action="store_true",
        help="skip the DTR (RMC) model-checking stage",
    )
    run.add_argument(
        "--with-runtime",
        action="store_true",
        help=(
            "additionally run a short runtime smoke of the compiled binary; "
            "off by default because it is not one of the workflow's required "
            "steps and only terminates for models with a bounded run"
        ),
    )

    return parser


def main(argv: list[str]) -> int:
    options = build_arg_parser().parse_args(argv)

    model_path = Path(options.model).expanduser().resolve()

    if options.out:
        out_dir = Path(options.out).expanduser().resolve()
    else:
        stamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
        out_dir = Path("/tmp") / f"relico-workflow.{stamp}"

    workflow = Workflow(
        model_path=model_path,
        out_dir=out_dir,
        command=options.command,
        run_model_check=not getattr(options, "skip_model_check", False),
        run_runtime=getattr(options, "with_runtime", False),
    )

    try:
        report = workflow.execute()
    except WorkflowError as error:
        print(f"relico: {error}", file=sys.stderr)
        return 2

    if options.json:
        printable = {k: v for k, v in report.items() if k != "_report_path"}
        print(json.dumps(printable, indent=2, sort_keys=True))
    else:
        print(render_report(report))

    # Exit code mirrors the verdict: A -> 0, B -> 1, C -> 2.
    return {"A": 0, "B": 1, "C": 2}.get(report["verdict"], 1)


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
