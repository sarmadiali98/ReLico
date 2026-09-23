#!/usr/bin/env bash
# ReLico artifact smoke test.
#
# The first command a VMCAI/FMCAD reviewer runs. One command, six gates, a few
# seconds warm. It is NOT the full evaluation (see scripts/reproduce.sh for
# that); it is a fast, deterministic end-to-end proof that the artifact works
# on this machine, driven entirely through the reviewer-facing user workflow
# (scripts/relico) and the existing verified pipeline stages. It adds no
# pipeline logic and changes no semantics.
#
#   [1/6] Environment        tools present, versions reported
#                            (scripts/verify-environment.sh)
#   [2/6] Lean build         the formal development builds (lake build)
#   [3/6] Translator         scripts/relico analyze <example>
#                            -> supported-fragment report, priority report,
#                               machine-readable JSON
#   [4/6] DTR analysis       scripts/relico run <example>
#                            -> DTR (RMC) model checking = satisfied
#   [5/6] LF compilation     -> verified translation to Lingua Franca + lfc
#   [6/6] Example execution  -> the generated native program runs to completion
#
# Example: examples/smoke/minimal.rebeca -- a single-actor periodic model that
# is deadlock-free (so DTR model checking is satisfied) and bounded in logical
# time (so the generated program terminates on its own). It is intentionally
# tiny and is not part of the benchmark corpus.
#
# Logs land under /tmp/relico-artifact-smoke.<pid>/ (a process-id stamp, not a
# wall-clock timestamp); nothing is written into the repository. Tool versions
# are captured there and, with --verbose, printed inline.
#
# Exit codes: 0 = READY (all gates pass), 1 = a gate failed, 2 = usage error.
set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

VERBOSE=0
while [ "$#" -gt 0 ]; do
  case "$1" in
    -v|--verbose) VERBOSE=1; shift ;;
    -h|--help)
      sed -n '2,32p' "$0" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) echo "smoke-test.sh: unknown option: $1" >&2; exit 2 ;;
  esac
done

PYTHON="${RELICO_PYTHON:-python3}"
LOG_DIR="/tmp/relico-artifact-smoke.$$"
mkdir -p "$LOG_DIR"

EXAMPLE="examples/smoke/minimal.rebeca"
RUN_OUT="$LOG_DIR/run"
ANALYZE_OUT="$LOG_DIR/analyze"

# Lean target: prefer the aggregate test library when declared, else the
# lakefile's defaultTargets -- identical detection to the other artifact
# scripts (scripts/reproduce.sh, scripts/smoke-test.sh).
if grep -q 'name = "RelicoTests"' "$REPO_ROOT/lakefile.toml" 2>/dev/null; then
  LEAN_TARGET="RelicoTests"
else
  LEAN_TARGET="$(sed -n 's/^defaultTargets = \[\?"\([^"]*\)"\].*/\1/p' \
    "$REPO_ROOT/lakefile.toml" | head -n 1)"
fi

# ---- presentation ----------------------------------------------------------

STATUS_COLUMN=26  # dotted-leader width so the PASS/FAIL column aligns

print_stage() { # print_stage <index> <label> <status>
  local left="[$1/6] $2 "
  while [ "${#left}" -lt "$STATUS_COLUMN" ]; do left="${left}."; done
  printf '%s %s\n' "$left" "$3"
}

FAILED_STAGE=""
FAIL_HINT=""
FAIL_LOG=""

fail_stage() { # fail_stage <index> <label> <hint> <logfile>
  print_stage "$1" "$2" "FAIL"
  FAILED_STAGE="$2"
  FAIL_HINT="$3"
  FAIL_LOG="$4"
}

# report_field <report.json> <python-expression-on-`d`>
report_field() {
  "$PYTHON" - "$1" "$2" <<'PY' 2>/dev/null
import json, sys
d = json.load(open(sys.argv[1]))
try:
    print(eval(sys.argv[2]))
except Exception:
    print("<missing>")
PY
}

echo "ReLico Artifact Smoke Test"
echo ""

# Resolve the real Apache Maven the same way verify-environment.sh does: a
# bare `mvn` on PATH may be an unrelated tool, so honor RELICO_MAVEN, then the
# known candidate paths, and only accept a binary that reports "Apache Maven".
resolve_maven() {
  local candidate
  if [ -n "${RELICO_MAVEN:-}" ]; then echo "$RELICO_MAVEN"; return; fi
  for candidate in \
    /opt/homebrew/opt/maven/bin/mvn \
    /opt/homebrew/bin/mvn \
    /usr/local/bin/mvn \
    "$HOME/.sdkman/candidates/maven/current/bin/mvn"; do
    if [ -x "$candidate" ] && "$candidate" -version 2>&1 | grep -q "Apache Maven"; then
      echo "$candidate"; return
    fi
  done
  command -v mvn 2>/dev/null || true
}
MAVEN_BIN="$(resolve_maven)"

# ---- [1/6] Environment ------------------------------------------------------
# Capture tool versions (requirement: report versions), then run the pinned
# environment/artifact check.
{
  echo "== tool versions =="
  { lake --version; } 2>&1 | head -n 1 | sed 's/^/lake:   /'
  { java -version; }  2>&1 | head -n 1 | sed 's/^/java:   /'
  { "${MAVEN_BIN:-mvn}" -version; } 2>&1 | grep -m1 "Apache Maven" | sed 's/^/maven:  /'
  { lfc --version; }  2>&1 | head -n 1 | sed 's/^/lfc:    /'
  { cmake --version; } 2>&1 | head -n 1 | sed 's/^/cmake:  /'
  { "$PYTHON" --version; } 2>&1 | head -n 1 | sed 's/^/python: /'
  echo ""
  echo "== verify-environment =="
} >"$LOG_DIR/environment.log"

if bash "$REPO_ROOT/scripts/verify-environment.sh" >>"$LOG_DIR/environment.log" 2>&1; then
  print_stage 1 "Environment" "PASS"
else
  fail_stage 1 "Environment" \
    "install missing tools or run scripts/install-dependencies.sh, then re-run" \
    "$LOG_DIR/environment.log"
fi

# ---- [2/6] Lean build -------------------------------------------------------
if [ -z "$FAILED_STAGE" ]; then
  if [ -z "$LEAN_TARGET" ]; then
    fail_stage 2 "Lean build" "no Lean target detected in lakefile.toml" ""
  elif command -v lake >/dev/null 2>&1 &&
       lake build "$LEAN_TARGET" >"$LOG_DIR/lean-build.log" 2>&1; then
    print_stage 2 "Lean build" "PASS"
  else
    fail_stage 2 "Lean build" \
      "check the Lean toolchain pin in lean-toolchain; a cold first build can take several minutes" \
      "$LOG_DIR/lean-build.log"
  fi
fi

# ---- [3/6] Translator (scripts/relico analyze) ------------------------------
# User workflow: supported-fragment report + priority report + JSON output.
if [ -z "$FAILED_STAGE" ]; then
  if scripts/relico analyze "$EXAMPLE" --out "$ANALYZE_OUT" --json \
        >"$LOG_DIR/analyze.json" 2>"$LOG_DIR/analyze.log"; then
    frag="$(report_field "$LOG_DIR/analyze.json" "d['supported_fragment']['status']")"
    prio="$(report_field "$LOG_DIR/analyze.json" "d['priorities']['status']")"
    json_ok="$(report_field "$LOG_DIR/analyze.json" "d['command']")"
    if [ "$frag" = "PASS" ] && [ "$prio" = "PASS" ] && [ "$json_ok" = "analyze" ]; then
      print_stage 3 "Translator" "PASS"
    else
      fail_stage 3 "Translator" \
        "analyze did not report a supported fragment (frag=$frag, priorities=$prio)" \
        "$LOG_DIR/analyze.log"
    fi
  else
    fail_stage 3 "Translator" \
      "scripts/relico analyze failed; inspect the parse/decode diagnostic" \
      "$LOG_DIR/analyze.log"
  fi
fi

# ---- [4/6],[5/6],[6/6] one full run (scripts/relico run --with-runtime) -----
# A single invocation drives DTR model checking, translation, LF compilation,
# and the runtime; the three gates below read its report.json.
if [ -z "$FAILED_STAGE" ]; then
  scripts/relico run --with-runtime "$EXAMPLE" --out "$RUN_OUT" \
    >"$LOG_DIR/run.log" 2>&1
  REPORT="$RUN_OUT/report.json"

  if [ ! -f "$REPORT" ]; then
    fail_stage 4 "DTR analysis" \
      "scripts/relico run produced no report.json" "$LOG_DIR/run.log"
  fi
fi

# ---- [4/6] DTR analysis -----------------------------------------------------
if [ -z "$FAILED_STAGE" ]; then
  mc="$(report_field "$REPORT" "d['model_checking']['status']")"
  if [ "$mc" = "PASS" ]; then
    print_stage 4 "DTR analysis" "PASS"
  else
    fail_stage 4 "DTR analysis" \
      "DTR (RMC) model checking did not succeed (status=$mc)" \
      "$RUN_OUT/logs/model-check.log"
  fi
fi

# ---- [5/6] LF compilation ---------------------------------------------------
if [ -z "$FAILED_STAGE" ]; then
  tr="$(report_field "$REPORT" "d['translation']['status']")"
  lf="$(report_field "$REPORT" "d['lf_compilation']['status']")"
  if [ "$tr" = "PASS" ] && [ "$lf" = "PASS" ]; then
    print_stage 5 "LF compilation" "PASS"
  else
    fail_stage 5 "LF compilation" \
      "translation or lfc compilation failed (translation=$tr, lfc=$lf)" \
      "$RUN_OUT/logs/compile.log"
  fi
fi

# ---- [6/6] Example execution ------------------------------------------------
if [ -z "$FAILED_STAGE" ]; then
  rt="$(report_field "$REPORT" "d['runtime']['status']")"
  if [ "$rt" = "PASS" ]; then
    print_stage 6 "Example execution" "PASS"
  else
    fail_stage 6 "Example execution" \
      "the generated native program did not run to completion (status=$rt)" \
      "$RUN_OUT/logs/runtime.log"
  fi
fi

echo ""

# ---- verdict ----------------------------------------------------------------
if [ -n "$FAILED_STAGE" ]; then
  echo "Artifact status: NOT READY"
  echo ""
  echo "  failed gate: $FAILED_STAGE"
  [ -n "$FAIL_HINT" ] && echo "  hint:        $FAIL_HINT"
  [ -n "$FAIL_LOG" ]  && echo "  log:         $FAIL_LOG"
  echo "  all logs:    $LOG_DIR"
  exit 1
fi

echo "Artifact status: READY"
echo ""
echo "Logs and tool versions: $LOG_DIR"
if [ "$VERBOSE" -eq 1 ]; then
  echo ""
  sed -n '/== tool versions ==/,/== verify-environment ==/p' \
    "$LOG_DIR/environment.log" | sed '$d'
fi
exit 0
