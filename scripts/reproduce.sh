#!/usr/bin/env bash
# VMCAI 2027 artifact reproduction: single reviewer-facing command that
# orchestrates the existing entry points. It contains no pipeline logic of
# its own.
#
#   Stage 0  environment verification        scripts/verify-environment.sh
#   Stage 1  formal build                    lake build <target from lakefile>
#   Stage 2  translator validation           tools/relico_test.sh
#   Stage 3  benchmark reproduction          tools/relico_bench.sh
#   Stage 4  ESP32 virtual-hardware case     lfc + run_virtual_hardware.sh
#
# Profiles (affect stages 2 and 3):
#   quick (default) — reviewer path:
#     stage 2: catalog tier + unit tier + one integration fixture per
#              semantic-layer family (8 fixtures, first per family)
#     stage 3: the 10 benchmarks with the smallest committed rmc-stage
#              timeout_seconds (manifest metadata; no hardcoded ids), plus
#              the smallest benchmark whose stages include rmc-properties if
#              not already selected
#   full — complete evaluation:
#     stage 2: catalog + unit + integration + external tiers (all 65
#              fixtures and the actor-priority negative fixture)
#     stage 3: all implemented benchmarks
#     external tier note: the fixture runner would auto-download the parser
#     archive if it were missing; reproduce.sh pre-checks the cache and
#     fails with instructions instead, so the full profile stays offline.
#
# Stage 4 never requires pytest or physical hardware by default;
# --with-esp32-tests adds the pytest suites (they re-run the scenarios).
#
# All logs are written under --results (default /tmp/relico-reproduce.<ts>,
# see RESULTS_DIR below); nothing is written into the repository by this
# script itself (bench/test artifact directories are gitignored).
#
# Exit codes: 0 = selected stages passed, 1 = a stage failed,
#             2 = usage or precondition error.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

PROFILE="quick"
RESULTS_DIR=""
WITH_ESP32_TESTS=0
KEEP_GOING=0
STAGES=()
while [ "$#" -gt 0 ]; do
  case "$1" in
    --profile) PROFILE="$2"; shift 2 ;;
    --results) RESULTS_DIR="$2"; shift 2 ;;
    --with-esp32-tests) WITH_ESP32_TESTS=1; shift ;;
    --keep-going) KEEP_GOING=1; shift ;;
    --stage) STAGES+=("$2"); shift 2 ;;
    *) echo "reproduce.sh: unknown option: $1" >&2; exit 2 ;;
  esac
done
case "$PROFILE" in
  quick|full) ;;
  *) echo "reproduce.sh: --profile must be quick or full" >&2; exit 2 ;;
esac
if [ "${#STAGES[@]}" -eq 0 ]; then STAGES=(0 1 2 3 4); fi
RESULTS_DIR="${RESULTS_DIR:-/tmp/relico-reproduce.$(date +%Y%m%d-%H%M%S)}"
mkdir -p "$RESULTS_DIR/benchmarks" "$RESULTS_DIR/esp32"
RESULTS_DIR="$(cd "$RESULTS_DIR" && pwd)"

PYTHON="${RELICO_PYTHON:-python3}"
TEST_ARGS=()
if [ "$KEEP_GOING" -eq 1 ]; then TEST_ARGS+=(--keep-going); fi

# Shared Maven build cache for the parser-bridge runners (outside the repo).
export RELICO_GENERAL_BUILD_DIR="$RESULTS_DIR/general-parser-build"

# Stage 1 Lean target: prefer the aggregate test library, else defaultTargets.
if grep -q 'name = "RelicoTests"' "$REPO_ROOT/lakefile.toml" 2>/dev/null; then
  LEAN_TARGET="RelicoTests"
else
  LEAN_TARGET="$(sed -n 's/^defaultTargets = \[\?"\([^"]*\)"\].*/\1/p' \
    "$REPO_ROOT/lakefile.toml" | head -n 1)"
fi

declare -a STAGE_STATUS
declare -a STAGE_NAMES

stage_record() { STAGE_NAMES+=("$1"); STAGE_STATUS+=("$2"); }

run_stage_0() {
  if bash "$REPO_ROOT/scripts/verify-environment.sh" \
      >"$RESULTS_DIR/environment.log" 2>&1; then
    stage_record 0 pass
    echo "STAGE 0 environment: pass"
  else
    tail -n 15 "$RESULTS_DIR/environment.log" | sed 's/^/  /' >&2
    stage_record 0 fail
    echo "STAGE 0 environment: FAIL — run scripts/install-dependencies.sh, then retry" >&2
    return 1
  fi
}

run_stage_1() {
  if lake build "$LEAN_TARGET" >"$RESULTS_DIR/build.log" 2>&1; then
    stage_record 1 pass
    echo "STAGE 1 formal-build($LEAN_TARGET): pass"
  else
    tail -n 15 "$RESULTS_DIR/build.log" | sed 's/^/  /' >&2
    stage_record 1 fail
    echo "STAGE 1 formal-build: FAIL — see $RESULTS_DIR/build.log" >&2
    return 1
  fi
}

# Select translator fixtures: one per semantic-layer family (first id).
quick_fixtures() {
  "$PYTHON" - <<'PY'
import csv
rows = list(csv.DictReader(open("evaluation/registry/benchmarks.tsv"), delimiter="\t"))
families = {}
for r in rows:
    if r["suite"] == "test" and r["implementation_status"] == "implemented":
        families.setdefault(r["semantic_layer"], r["benchmark_id"])
for fid in sorted(families.values()):
    print(fid)
PY
}

run_stage_2() {
  local fixture_ids=()
  if [ "$PROFILE" = quick ]; then
    # relico_test.py filter semantics: --tier filters and --case ids cannot be
    # combined (a case must match the tier AND be named, or no filter at all).
    # Run the contract tiers first, then the representative fixtures by id.
    local fid
    while IFS= read -r fid; do fixture_ids+=("$fid"); done < <(quick_fixtures)
    local fixture_args=()
    for fid in "${fixture_ids[@]}"; do fixture_args+=(--case "fixture::$fid"); done
    if ! tools/relico_test.sh ${TEST_ARGS[@]+"${TEST_ARGS[@]}"} \
        --tier catalog --tier unit >>"$RESULTS_DIR/translator.log" 2>&1; then
      stage_record 2 fail
      tail -n 20 "$RESULTS_DIR/translator.log" | sed 's/^/  /' >&2
      echo "STAGE 2 translator(quick): FAIL (catalog/unit) — see $RESULTS_DIR/translator.log" >&2
      return 1
    fi
    if ! tools/relico_test.sh ${TEST_ARGS[@]+"${TEST_ARGS[@]}"} \
        "${fixture_args[@]}" >>"$RESULTS_DIR/translator.log" 2>&1; then
      stage_record 2 fail
      tail -n 20 "$RESULTS_DIR/translator.log" | sed 's/^/  /' >&2
      echo "STAGE 2 translator(quick): FAIL (representative fixtures) — see $RESULTS_DIR/translator.log" >&2
      return 1
    fi
    stage_record 2 pass
    echo "STAGE 2 translator(quick): pass (catalog + unit + ${#fixture_ids[@]} family-representative fixtures)"
    return 0
  fi
  # Full profile: all four tiers in one invocation.
  # External tier stays offline: pre-seed check instead of silent download.
  local parser_zip="$HOME/.cache/relico/parser/2.25/org.rebecalang.compiler-94ca579e0f2e3528d8de608a9e86316ecb78d608.zip"
  if [ ! -f "${RELICO_PARSER_ARTIFACT:-$parser_zip}" ]; then
    echo "STAGE 2 translator: FAIL — parser archive missing (${RELICO_PARSER_ARTIFACT:-$parser_zip})" >&2
    echo "  hint: run scripts/install-dependencies.sh first; the external tier must not download" >&2
    stage_record 2 fail
    return 1
  fi
  if ! tools/relico_test.sh ${TEST_ARGS[@]+"${TEST_ARGS[@]}"} \
      --tier catalog --tier unit --tier integration --tier external \
      >"$RESULTS_DIR/translator.log" 2>&1; then
    local rc=$?
    tail -n 20 "$RESULTS_DIR/translator.log" | sed 's/^/  /' >&2
    stage_record 2 fail
    echo "STAGE 2 translator(full): FAIL (exit $rc) — see $RESULTS_DIR/translator.log" >&2
    return 1
  fi
  stage_record 2 pass
  echo "STAGE 2 translator(full): pass"
}

# Select benchmarks by committed manifest metadata: ascending rmc-stage
# timeout_seconds (state-space bound), tie-broken by benchmark_id.
quick_benchmarks() {
  "$PYTHON" - "$RESULTS_DIR" <<'PY'
import glob, json, sys
rows = []
have_props = []
for path in glob.glob("benchmarks/*/manifest.json"):
    m = json.load(open(path))
    if m.get("implementation_status", "implemented") != "implemented":
        continue
    rmc_timeout = next(
        (s.get("timeout_seconds", 300) for s in m["stages"] if s["name"] == "rmc"),
        300,
    )
    rows.append((rmc_timeout, m["benchmark_id"], [s["name"] for s in m["stages"]]))
rows.sort()
selected = [bid for _, bid, _ in rows[:10]]
if not any("rmc-properties" in stages for _, bid, stages in rows if bid in selected):
    for t, bid, stages in rows:
        if "rmc-properties" in stages:
            selected.append(bid)
            break
print("\n".join(selected))
PY
}

run_stage_3() {
  local ids=()
  if [ "$PROFILE" = quick ]; then
    # bash-3.2-safe mapfile replacement (macOS ships bash 3.2)
    while IFS= read -r bid; do ids+=("$bid"); done < <(quick_benchmarks)
  else
    while IFS= read -r bid; do ids+=("$bid"); done < <(
      awk -F'\t' 'NR>1 && $2=="benchmark" && $12=="implemented" {print $1}' \
        evaluation/registry/benchmarks.tsv
    )
  fi
  local failed=0 bid
  for bid in "${ids[@]}"; do
    if tools/relico_bench.sh --benchmark "$bid" \
        >"$RESULTS_DIR/benchmarks/$bid.log" 2>&1; then
      echo "  benchmark $bid: pass"
    else
      failed=$((failed + 1))
      echo "  benchmark $bid: FAIL (see $RESULTS_DIR/benchmarks/$bid.log)" >&2
      [ "$KEEP_GOING" -eq 1 ] || break
    fi
  done
  if [ "$failed" -eq 0 ]; then
    stage_record 3 pass
    echo "STAGE 3 benchmarks($PROFILE, ${#ids[@]} benchmarks): pass"
  else
    stage_record 3 fail
    echo "STAGE 3 benchmarks($PROFILE): FAIL ($failed benchmark(s) failed)" >&2
    return 1
  fi
}

run_stage_4() {
  local lfc_bin=""
  if command -v lfc >/dev/null 2>&1; then
    lfc_bin="$(command -v lfc)"
  else
    lfc_bin="$(find "${RELICO_CACHE_DIR:-$HOME/.cache/relico}/lf" -name lfc -type f 2>/dev/null | head -n 1)"
  fi
  if [ -z "$lfc_bin" ]; then
    stage_record 4 fail
    echo "STAGE 4 esp32: FAIL — lfc not found (run scripts/install-dependencies.sh --with-lfc)" >&2
    return 1
  fi
  if ! "$lfc_bin" esp32/smarthome/hardware/smarthome.lf \
      >"$RESULTS_DIR/esp32/lfc-build.log" 2>&1; then
    tail -n 15 "$RESULTS_DIR/esp32/lfc-build.log" | sed 's/^/  /' >&2
    stage_record 4 fail
    echo "STAGE 4 esp32: FAIL — lfc build of hardware/smarthome.lf failed" >&2
    return 1
  fi
  if ! LOG_DIR="$RESULTS_DIR/esp32" \
      bash esp32/smarthome/scenario/run_virtual_hardware.sh --all \
      >"$RESULTS_DIR/esp32/runner.log" 2>&1; then
    tail -n 20 "$RESULTS_DIR/esp32/runner.log" | sed 's/^/  /' >&2
    stage_record 4 fail
    echo "STAGE 4 esp32: FAIL — virtual runner rejected a scenario (markers/logs in $RESULTS_DIR/esp32)" >&2
    return 1
  fi
  echo "  esp32 virtual scenarios: pass (logs in $RESULTS_DIR/esp32)"
  if [ "$WITH_ESP32_TESTS" -eq 1 ]; then
    if ! "$PYTHON" -c 'import pytest' >/dev/null 2>&1; then
      stage_record 4 fail
      echo "STAGE 4 esp32: FAIL — --with-esp32-tests requires pytest (python3 -m pip install pytest)" >&2
      return 1
    fi
    if ! LOG_DIR="$RESULTS_DIR/esp32-tests" "$PYTHON" -m pytest \
        esp32/smarthome/hardware/tests esp32/smarthome/bridge/tests esp32/smarthome/scenario/tests \
        >"$RESULTS_DIR/esp32/pytest.log" 2>&1; then
      tail -n 20 "$RESULTS_DIR/esp32/pytest.log" | sed 's/^/  /' >&2
      stage_record 4 fail
      echo "STAGE 4 esp32: FAIL — pytest suites failed" >&2
      return 1
    fi
    echo "  esp32 pytest suites: pass"
  fi
  stage_record 4 pass
  echo "STAGE 4 esp32: pass"
}

overall=0
for stage in "${STAGES[@]}"; do
  case "$stage" in
    0) run_stage_0 || overall=1 ;;
    1) run_stage_1 || overall=1 ;;
    2) run_stage_2 || overall=1 ;;
    3) run_stage_3 || overall=1 ;;
    4) run_stage_4 || overall=1 ;;
    *) echo "reproduce.sh: invalid stage $stage (0-4)" >&2; exit 2 ;;
  esac
done

# Summary: human-readable + machine-readable, both outside the repository.
{
  echo "profile=$PROFILE"
  echo "results_dir=$RESULTS_DIR"
  echo "lean_target=${LEAN_TARGET:-?}"
  i=0
  for name in "${STAGE_NAMES[@]}"; do
    echo "stage $name: ${STAGE_STATUS[$i]}"
    i=$((i + 1))
  done
} >"$RESULTS_DIR/summary.txt"

"$PYTHON" - "$RESULTS_DIR" "$PROFILE" <<'PY'
import json, sys
results_dir, profile = sys.argv[1], sys.argv[2]
lines = open(results_dir + "/summary.txt").read().splitlines()
stages = {
    line.split()[1]: line.split(": ")[1]
    for line in lines
    if line.startswith("stage ")
}
status = "pass" if all(v == "pass" for v in stages.values()) and stages else "fail"
json.dump(
    {"profile": profile, "status": status, "stages": stages},
    open(results_dir + "/summary.json", "w"),
    indent=2, sort_keys=True,
)
PY

echo "REPRODUCE_SUMMARY=$RESULTS_DIR/summary.txt"
if [ "$overall" -eq 0 ]; then
  echo "REPRODUCE_TEST=pass"
else
  echo "REPRODUCE_TEST=fail"
fi
exit "$overall"
