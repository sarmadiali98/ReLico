#!/usr/bin/env bash
# VMCAI 2027 artifact smoke test: minimal end-to-end proof that the artifact
# works on this machine. One command, four gates, < 5 minutes warm.
#
# Gate 0  environment + pinned artifacts   scripts/verify-environment.sh
# Gate 1  Lean proof boundary builds       lake build <detected target>
# Gate 2  fast harness tests               relico_test.py (catalog + python only)
# Gate 3  one end-to-end pipeline          relico_bench.py --benchmark <fixture>
#
# Gate 3 fixture: core--one-step-execution--positive
#   - smallest registered translator fixture (tests/translator/), and the
#     fastest of the measured candidates: warm end-to-end run is ~35 s
#     (rmc 7 s, parser-json incl. Maven 9 s, lfc incl. generated C++ build 10 s)
#   - its stage chain exercises every trusted external tool exactly once:
#     parser -> JSON -> Lean export -> lfc -> generated C++ -> RMC verdict ->
#     native runtime
#
# ESP32 case-study suites and the external-tier fixture are intentionally not
# part of the smoke test; see DEPENDENCIES.md and VMCAI_ARTIFACT.md.
#
# Logs: /tmp/relico-smoke.<pid>/ only. Nothing is written into the repository.
# Exit codes: 0 = all gates pass, 1 = a gate failed, 2 = usage/environment error.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_DIR="/tmp/relico-smoke.$$"
mkdir -p "$LOG_DIR"
PYTHON="${RELICO_PYTHON:-python3}"

# Gate 1 target detection: prefer the aggregate test library when the lakefile
# declares it, otherwise fall back to the lakefile's defaultTargets.
if grep -q 'name = "RelicoTests"' "$REPO_ROOT/lakefile.toml" 2>/dev/null; then
  LEAN_TARGET="RelicoTests"
else
  LEAN_TARGET="$(sed -n 's/^defaultTargets = \[\?"\([^"]*\)"\].*/\1/p' \
    "$REPO_ROOT/lakefile.toml" | head -n 1)"
  if [ -z "$LEAN_TARGET" ]; then
    echo "SMOKE GATE 1 lake-build ......... FAIL: no Lean target detected in lakefile.toml" >&2
    exit 2
  fi
fi

# Gate 3 fixture: see rationale in the header comment.
SMOKE_FIXTURE="core--one-step-execution--positive"

echo "SMOKE_LOG_DIR=$LOG_DIR"

gate_pass() { echo "SMOKE GATE $1 $2 ..... PASS"; }
gate_fail() {
  echo "SMOKE GATE $1 $2 ..... FAIL: $3" >&2
  echo "  hint: $4" >&2
  echo "  log:  $LOG_DIR/$5" >&2
  echo "SMOKE_TEST=fail"
  exit 1
}

# ---- Gate 0: environment and pinned artifacts (no downloads) ----------------
if bash "$REPO_ROOT/scripts/verify-environment.sh" >"$LOG_DIR/gate0.log" 2>&1; then
  gate_pass 0 environment
else
  tail -n 15 "$LOG_DIR/gate0.log" | sed 's/^/  /' >&2
  gate_fail 0 environment "environment or pinned-artifact check failed" \
    "install missing tools or run scripts/install-dependencies.sh, then re-run" gate0.log
fi

# ---- Gate 1: Lean proof boundary builds -------------------------------------
cd "$REPO_ROOT"
if command -v lake >/dev/null 2>&1; then
  if lake build "$LEAN_TARGET" >"$LOG_DIR/gate1.log" 2>&1; then
    gate_pass 1 "lake-build($LEAN_TARGET)"
  else
    tail -n 15 "$LOG_DIR/gate1.log" | sed 's/^/  /' >&2
    gate_fail 1 "lake-build($LEAN_TARGET)" "Lean build failed" \
      "check the Lean toolchain pin in lean-toolchain; cold first builds can take several minutes" gate1.log
  fi
else
  gate_fail 1 "lake-build" "lake executable not found" \
    "install elan/Lean per DEPENDENCIES.md (lean-toolchain pins leanprover/lean4:v4.32.1)" gate1.log
fi

# ---- Gate 2: fast harness tests (catalog + python only) ----------------------
if "$PYTHON" tools/relico_test.py --suite catalog --suite python \
    >"$LOG_DIR/gate2.log" 2>&1; then
  fast_total="$(grep -c '^\(PASS\|FAIL\|SKIP\|UNAVAILABLE\) ' "$LOG_DIR/gate2.log" || true)"
  gate_pass 2 "fast-tests($fast_total cases)"
else
  tail -n 15 "$LOG_DIR/gate2.log" | sed 's/^/  /' >&2
  gate_fail 2 fast-tests "catalog or python contract tests failed" \
    "inspect the failing case above; .test-results/ under the repository root holds per-case stdout/stderr" gate2.log
fi

# ---- Gate 3: one end-to-end pipeline (parser, Lean, lfc, RMC, runtime) -------
if "$PYTHON" tools/relico_bench.py --benchmark "$SMOKE_FIXTURE" \
    >"$LOG_DIR/gate3.log" 2>&1; then
  gate_pass 3 "end-to-end($SMOKE_FIXTURE)"
else
  tail -n 20 "$LOG_DIR/gate3.log" | sed 's/^/  /' >&2
  gate_fail 3 "end-to-end($SMOKE_FIXTURE)" \
    "pipeline stage failed (parser / lean-export / lfc / rmc / runtime)" \
    "inspect the stage logs under tests/translator/$SMOKE_FIXTURE/actual/; common causes: missing Maven/Lake paths in manifests on non-author machines" gate3.log
fi

echo "SMOKE_TEST=pass"
