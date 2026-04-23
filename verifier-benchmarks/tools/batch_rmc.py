#!/usr/bin/env python3
import argparse
import csv
import shutil
import subprocess
import sys
import time
import xml.etree.ElementTree as ET
from pathlib import Path


SCRIPT_PATH = Path(__file__).resolve()
TOOLS_DIR = SCRIPT_PATH.parent
REPO_ROOT = TOOLS_DIR.parent
DEFAULT_ROOT = REPO_ROOT / "src"
DEFAULT_TOOLS = TOOLS_DIR
DEFAULT_RMC_JAR = TOOLS_DIR / "rmc-2.14.jar"


def run_timed(cmd, cwd: Path, stdout_path: Path, stderr_path: Path):
    start = time.monotonic()
    with stdout_path.open("w", encoding="utf-8") as out, stderr_path.open("w", encoding="utf-8") as err:
        proc = subprocess.run(cmd, cwd=str(cwd), stdout=out, stderr=err)
    elapsed = time.monotonic() - start
    return proc.returncode, elapsed


def strip_comments_from_line(line: str, in_block_comment: bool):
    result = []
    i = 0
    in_string = None

    while i < len(line):
        ch = line[i]
        nxt = line[i + 1] if i + 1 < len(line) else ""

        if in_block_comment:
            if ch == "*" and nxt == "/":
                in_block_comment = False
                i += 2
            else:
                i += 1
            continue

        if in_string is not None:
            result.append(ch)
            if ch == "\\" and i + 1 < len(line):
                result.append(line[i + 1])
                i += 2
                continue
            if ch == in_string:
                in_string = None
            i += 1
            continue

        if ch in ("'", '"'):
            in_string = ch
            result.append(ch)
            i += 1
        elif ch == "/" and nxt == "/":
            break
        elif ch == "/" and nxt == "*":
            in_block_comment = True
            i += 2
        else:
            result.append(ch)
            i += 1

    return "".join(result), in_block_comment


def count_loc(path: Path):
    try:
        count = 0
        in_block_comment = False
        with path.open("r", encoding="utf-8", errors="ignore") as f:
            for raw_line in f:
                stripped_line, in_block_comment = strip_comments_from_line(
                    raw_line.rstrip("\n"), in_block_comment
                )
                if stripped_line.strip():
                    count += 1
        return count
    except Exception:
        return ""


def count_total_loc(paths):
    total = 0
    seen_any = False
    for p in paths:
        loc = count_loc(p)
        if isinstance(loc, int):
            total += loc
            seen_any = True
    return total if seen_any else ""


def parse_result_xml(result_xml: Path):
    data = {
        "reached_states": "",
        "reached_transitions": "",
        "analysis_result": "",
        "tool_total_spent_time_raw": "",
        "tool_consumed_mem_raw": "",
    }
    if not result_xml.exists():
        return data

    try:
        root = ET.parse(result_xml).getroot()
        data["reached_states"] = root.findtext("./system-info/reached-states", default="")
        data["reached_transitions"] = root.findtext("./system-info/reached-transitions", default="")
        data["analysis_result"] = root.findtext("./checked-property/result", default="")
        data["tool_total_spent_time_raw"] = root.findtext("./system-info/total-spent-time", default="")
        data["tool_consumed_mem_raw"] = root.findtext("./system-info/consumed-mem", default="")
    except Exception:
        pass
    return data


def find_single_file(folder: Path, pattern: str):
    files = sorted(folder.glob(pattern))
    if len(files) == 0:
        return None
    if len(files) > 1:
        raise RuntimeError(f"Expected one {pattern} in {folder}, found {len(files)}")
    return files[0]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", default=str(DEFAULT_ROOT),
                    help="Root folder containing one subfolder per model")
    ap.add_argument("--tools", default=str(DEFAULT_TOOLS),
                    help="Folder containing rmc jar")
    ap.add_argument("--rmc-jar", default="rmc-2.14.jar",
                    help="Jar filename inside the tools folder")
    ap.add_argument("--java", default="java",
                    help="Java executable (default: java from PATH)")
    ap.add_argument("--cxx", default="c++",
                    help="C++ compiler command (default: c++)")
    ap.add_argument("--engine", default="TIMED_REBECA",
                    help="RMC engine")
    ap.add_argument("--version", default="2.1",
                    help="RMC language version")
    ap.add_argument("--only", default="",
                    help="Run only one model folder name")
    args = ap.parse_args()

    root = Path(args.root).expanduser().resolve()
    tools = Path(args.tools).expanduser().resolve()
    rmc_jar = (tools / args.rmc_jar).resolve()
    java_cmd = args.java
    cxx_cmd = args.cxx

    runs_dir = root.parent / "_cli_runs"
    runs_dir.mkdir(parents=True, exist_ok=True)
    csv_path = runs_dir / "results.csv"

    if not root.exists():
        print(f"ERROR: root folder does not exist: {root}", file=sys.stderr)
        sys.exit(1)
    if not rmc_jar.exists():
        print(f"ERROR: RMC jar not found: {rmc_jar}", file=sys.stderr)
        sys.exit(1)

    model_dirs = [p for p in sorted(root.iterdir()) if p.is_dir()]
    if args.only:
        model_dirs = [p for p in model_dirs if p.name == args.only]

    fieldnames = [
        "model",
        "rebeca_file",
        "property_file",
        "rebeca_loc",
        "property_loc",
        "generated_cpp_loc",
        "generation_seconds",
        "compile_seconds",
        "verification_seconds",
        "total_seconds",
        "generation_rc",
        "compile_rc",
        "verification_rc",
        "reached_states",
        "reached_transitions",
        "analysis_result",
        "tool_total_spent_time_raw",
        "tool_consumed_mem_raw",
        "run_dir",
        "result_xml",
        "statespace_xml",
    ]

    with csv_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for model_dir in model_dirs:
            model = model_dir.name
            try:
                rebeca_file = find_single_file(model_dir, "*.rebeca")
                property_file = find_single_file(model_dir, "*.property")

                if rebeca_file is None:
                    print(f"[SKIP] {model}: no .rebeca file found")
                    continue
                if property_file is None:
                    print(f"[SKIP] {model}: no .property file found")
                    continue

                rebeca_loc = count_loc(rebeca_file)
                property_loc = count_loc(property_file)

                run_dir = runs_dir / model
                if run_dir.exists():
                    shutil.rmtree(run_dir)
                run_dir.mkdir(parents=True)

                gen_stdout = run_dir / "generation.stdout.txt"
                gen_stderr = run_dir / "generation.stderr.txt"
                build_stdout = run_dir / "compile.stdout.txt"
                build_stderr = run_dir / "compile.stderr.txt"
                verify_stdout = run_dir / "verify.stdout.txt"
                verify_stderr = run_dir / "verify.stderr.txt"
                result_xml = run_dir / "result.xml"
                statespace_xml = run_dir / "statespace.xml"

                gen_cmd = [
                    java_cmd, "-jar", str(rmc_jar),
                    "-s", str(rebeca_file),
                    "-p", str(property_file),
                    "-o", str(run_dir),
                    "-v", str(args.version),
                    "-e", str(args.engine),
                    "--tts",
                    "-x", str(statespace_xml),
                ]

                print(f"[RUN] {model} :: generation")
                gen_rc, gen_s = run_timed(gen_cmd, cwd=model_dir, stdout_path=gen_stdout, stderr_path=gen_stderr)

                compile_rc = ""
                compile_s = ""
                verify_rc = ""
                verify_s = ""
                generated_cpp_loc = ""
                parsed = {
                    "reached_states": "",
                    "reached_transitions": "",
                    "analysis_result": "",
                    "tool_total_spent_time_raw": "",
                    "tool_consumed_mem_raw": "",
                }

                if gen_rc == 0:
                    cpp_files = sorted(run_dir.glob("*.cpp"))
                    if not cpp_files:
                        raise RuntimeError("Generation succeeded but no .cpp files were found")

                    generated_cpp_loc = count_total_loc(cpp_files)

                    exe = run_dir / "executable"
                    compile_cmd = [cxx_cmd] + [str(p) for p in cpp_files] + ["-w", "-o", str(exe)]

                    print(f"[RUN] {model} :: compile")
                    compile_rc, compile_s = run_timed(
                        compile_cmd, cwd=run_dir, stdout_path=build_stdout, stderr_path=build_stderr
                    )

                    if compile_rc == 0:
                        verify_cmd = [str(exe), "-o", str(result_xml)]
                        print(f"[RUN] {model} :: verify")
                        verify_rc, verify_s = run_timed(
                            verify_cmd, cwd=run_dir, stdout_path=verify_stdout, stderr_path=verify_stderr
                        )
                        parsed = parse_result_xml(result_xml)

                total_s = ""
                if isinstance(gen_s, float):
                    total_s = gen_s
                    if isinstance(compile_s, float):
                        total_s += compile_s
                    if isinstance(verify_s, float):
                        total_s += verify_s

                row = {
                    "model": model,
                    "rebeca_file": str(rebeca_file),
                    "property_file": str(property_file),
                    "rebeca_loc": rebeca_loc,
                    "property_loc": property_loc,
                    "generated_cpp_loc": generated_cpp_loc,
                    "generation_seconds": f"{gen_s:.6f}" if isinstance(gen_s, float) else "",
                    "compile_seconds": f"{compile_s:.6f}" if isinstance(compile_s, float) else "",
                    "verification_seconds": f"{verify_s:.6f}" if isinstance(verify_s, float) else "",
                    "total_seconds": f"{total_s:.6f}" if isinstance(total_s, float) else "",
                    "generation_rc": gen_rc,
                    "compile_rc": compile_rc,
                    "verification_rc": verify_rc,
                    "reached_states": parsed["reached_states"],
                    "reached_transitions": parsed["reached_transitions"],
                    "analysis_result": parsed["analysis_result"],
                    "tool_total_spent_time_raw": parsed["tool_total_spent_time_raw"],
                    "tool_consumed_mem_raw": parsed["tool_consumed_mem_raw"],
                    "run_dir": str(run_dir),
                    "result_xml": str(result_xml) if result_xml.exists() else "",
                    "statespace_xml": str(statespace_xml) if statespace_xml.exists() else "",
                }
                writer.writerow(row)
                f.flush()

            except Exception as e:
                print(f"[ERROR] {model}: {e}")

    print()
    print(f"Done. Results written to: {csv_path}")


if __name__ == "__main__":
    main()
