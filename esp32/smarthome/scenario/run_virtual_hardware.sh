#!/usr/bin/env bash
#
# Virtual hardware execution runner for the ReLico ESP32 smart-home
# case study (deployment artifact only).
#
# Prepares a controlled sensor input, executes the hardware-adapted LF
# binary built from esp32/smarthome/hardware/smarthome.lf, captures the
# runtime trace, and validates that the required property markers were
# emitted. Exits non-zero if any required marker is missing.
#
# Usage:
#   run_virtual_hardware.sh <scenario-name> [duration-seconds]
#   run_virtual_hardware.sh --all [duration-seconds]
#   run_virtual_hardware.sh --list
#
# Environment overrides:
#   LOG_DIR       output directory for logs
#                 (default: <script-dir>/../logs)
#   SMARTHOME_BIN path to the compiled LF binary
#                 (default: <repo-root>/bin/smarthome)
#   SMARTHOME_LIB directory with the reactor-cpp shared library
#                 (default: <repo-root>/lib)
#
# This runner produces RUNTIME EVIDENCE only. It is not a formal
# verification and makes no correctness claim. See
# docs/STAGE6_RUNTIME_VALIDATION.md for the claim boundaries.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
HARDWARE_LF="$REPO_ROOT/esp32/smarthome/hardware/smarthome.lf"

LOG_DIR="${LOG_DIR:-$SCRIPT_DIR/../logs}"
mkdir -p "$LOG_DIR"
LOG_DIR="$(cd -P "$LOG_DIR" && pwd)"
SCENARIO_LOG_DIR="$LOG_DIR/hardware-scenarios"
BIN="${SMARTHOME_BIN:-$REPO_ROOT/bin/smarthome}"
LIB_DIR="${SMARTHOME_LIB:-$REPO_ROOT/lib}"

DEFAULT_DURATION=5

# ---------------------------------------------------------------------------
# Scenario definitions and required property markers.
#
# Sensor encoding (same as the old workflow documentation):
#   temp     temperature in Celsius (int-truncated by the LF sensor helper)
#   humidity humidity percentage (unused by the control logic)
#   light    0 = bright, 1 = dark
#   motion   0 = none, 1 = motion detected
#
# Required markers follow the property-to-scenario mapping of the old
# case study: FireKeepsDoorOpen (1,3), FireOverridesIntrusion (3),
# HeaterOffDuringFire (1,3), EmergencyImpliesAlarmOrHistory (1,2,3),
# LightOffDuringIntrusionOverride (2).
# ---------------------------------------------------------------------------
SCENARIOS=(
  "scenario-1-fire-emergency|38.0|40.0|0|0|FireKeepsDoorOpen HeaterOffDuringFire EmergencyImpliesAlarmOrHistory"
  "scenario-2-intrusion-stealth|24.0|40.0|1|1|EmergencyImpliesAlarmOrHistory LightOffDuringIntrusionOverride"
  "scenario-3-fire-overrides-intrusion|38.0|40.0|1|1|FireKeepsDoorOpen FireOverridesIntrusion HeaterOffDuringFire EmergencyImpliesAlarmOrHistory"
  "scenario-4-normal-baseline|27.0|40.0|0|0|-"
  "scenario-5-cold-temperature|18.0|40.0|0|0|-"
)

scenario_row() {
  local name="$1"
  for row in "${SCENARIOS[@]}"; do
    if [[ "${row%%|*}" == "$name" ]]; then
      printf '%s' "$row"
      return 0
    fi
  done
  return 1
}

list_scenarios() {
  echo "scenario                        temp  humidity  light  motion  required property markers"
  echo "------------------------------- ----- --------- ------ ------ ---------------------------"
  for row in "${SCENARIOS[@]}"; do
    IFS='|' read -r name temp hum light motion required <<< "$row"
    printf '%-32s %-5s %-9s %-6s %-6s %s\n' \
      "$name" "$temp" "$hum" "$light" "$motion" \
      "$([ "$required" = "-" ] && echo '(none - baseline)' || echo "$required")"
  done
}

check_environment() {
  if [[ ! -x "$BIN" ]]; then
    echo "ERROR: hardware LF binary not found or not executable: $BIN" >&2
    echo "Build it first from the repository root:" >&2
    echo "  lfc esp32/smarthome/hardware/smarthome.lf" >&2
    exit 2
  fi
  if [[ ! -f "$HARDWARE_LF" ]]; then
    echo "ERROR: hardware LF not found: $HARDWARE_LF" >&2
    exit 2
  fi
  # Evidence integrity: refuse to validate a binary that predates the
  # current hardware LF source.
  if [[ "$BIN" -ot "$HARDWARE_LF" ]]; then
    echo "ERROR: binary $BIN is older than $HARDWARE_LF" >&2
    echo "Rebuild it before collecting evidence:" >&2
    echo "  lfc esp32/smarthome/hardware/smarthome.lf" >&2
    exit 2
  fi
}

# run_scenario <name> <temp> <humidity> <light> <motion> <required-markers> <duration>
# Returns 0 if all required markers were emitted (and, for baseline
# scenarios, no property markers were emitted at all).
run_scenario() {
  local name="$1" temp="$2" humidity="$3" light="$4" motion="$5" required="$6" duration="$7"
  local workdir rawlog destlog status=0

  workdir="$(mktemp -d "${TMPDIR:-/tmp}/vh-XXXXXXXX")"
  rawlog="$workdir/run.log"
  destlog="$SCENARIO_LOG_DIR/$name.log"

  # 1. Prepare the sensor input (one controlled record; the binary
  #    re-reads the latest record on every sensor cycle).
  cat > "$workdir/sensor_data.jsonl" <<EOF
{"temp": $temp, "humidity": $humidity, "light": $light, "motion": $motion, "timestamp": 0}
EOF

  # 2. Execute the hardware LF binary with the library path it needs.
  #    A provenance header (date, scenario input, binary, hardware LF
  #    checksum) is recorded with the evidence.
  (
    cd "$workdir"
    {
      echo "# virtual-hardware scenario: $name"
      echo "# date: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
      echo "# input: temp=$temp humidity=$humidity light=$light motion=$motion duration=${duration}s"
      echo "# binary: $BIN (built from esp32/smarthome/hardware/smarthome.lf)"
      echo "# hardware-lf-sha256: $(shasum -a 256 "$HARDWARE_LF" | cut -d' ' -f1)"
      echo "# formal artifact: esp32/smarthome/generated/TranslatedLFProgram.lf (immutable, not executed here)"
      echo "# evidence role: runtime observation only, not a correctness proof"
    } > "$rawlog"
    DYLD_LIBRARY_PATH="$LIB_DIR" LD_LIBRARY_PATH="$LIB_DIR" \
      "$BIN" >> "$rawlog" 2>&1 &
    pid=$!
    sleep "$duration"
    kill "$pid" 2>/dev/null || true
    wait "$pid" 2>/dev/null || true
  )

  # 3. Save the log as evidence.
  mkdir -p "$SCENARIO_LOG_DIR"
  cp "$rawlog" "$destlog"

  # 4. Validate marker format: every line starting with '[' must be a
  #    well-formed [EVENT]/[INFO]/[PROPERTY] marker line.
  local malformed
  malformed="$(grep -n '^\[' "$destlog" | grep -vE '^[0-9]+:\[(EVENT|INFO|PROPERTY)\] .+' || true)"
  if [[ -n "$malformed" ]]; then
    echo "  FAIL: malformed marker lines in $name:"
    echo "$malformed" | sed 's/^/    /'
    status=1
  fi

  # 5. Validate required property markers.
  local marker
  if [[ "$required" = "-" ]]; then
    # Baseline scenarios must not emit any property markers.
    if grep -q '^\[PROPERTY\]' "$destlog"; then
      echo "  FAIL: $name emitted unexpected property markers:"
      grep '^\[PROPERTY\]' "$destlog" | sed 's/^/    /'
      status=1
    else
      echo "  PASS: $name (baseline: no property markers, as expected)"
    fi
  else
    for marker in $required; do
      if grep -q "^\[PROPERTY\] $marker:" "$destlog"; then
        echo "  PASS: $name -> $marker"
      else
        echo "  FAIL: $name -> required marker missing: $marker"
        status=1
      fi
    done
  fi

  rm -rf "$workdir"
  return $status
}

regenerate_summary_logs() {
  local summary="$LOG_DIR/hardware-scenarios-summary.log"
  local markers="$LOG_DIR/hardware-property-markers.log"
  : > "$summary"
  for row in "${SCENARIOS[@]}"; do
    IFS='|' read -r name _ _ _ _ _ <<< "$row"
    local log="$SCENARIO_LOG_DIR/$name.log"
    [[ -f "$log" ]] || continue
    echo "===== logs/hardware-scenarios/$name.log =====" >> "$summary"
    grep -E "\[EVENT\]|\[INFO\]|\[PROPERTY\]" "$log" | head -120 >> "$summary" || true
    echo >> "$summary"
  done
  grep -R "\[PROPERTY\]" "$SCENARIO_LOG_DIR" > "$markers" || true
}

main() {
  local mode="${1:-}"
  local duration="$DEFAULT_DURATION"

  if [[ -z "$mode" || "$mode" = "-h" || "$mode" = "--help" ]]; then
    sed -n '2,30p' "${BASH_SOURCE[0]}"
    exit 0
  fi

  if [[ "$mode" = "--list" ]]; then
    list_scenarios
    exit 0
  fi

  if [[ "$mode" = "--all" ]]; then
    duration="${2:-$DEFAULT_DURATION}"
    check_environment
    echo "Virtual hardware execution (deployment artifact: esp32/smarthome/hardware/smarthome.lf)"
    echo "Binary: $BIN"
    echo "Duration per scenario: ${duration}s"
    echo
    local overall=0 row name
    for row in "${SCENARIOS[@]}"; do
      IFS='|' read -r name temp hum light motion required <<< "$row"
      echo "=== $name (temp=$temp humidity=$hum light=$light motion=$motion) ==="
      run_scenario "$name" "$temp" "$hum" "$light" "$motion" "$required" "$duration" || overall=1
      echo
    done
    regenerate_summary_logs
    echo "Summary logs:"
    echo "  $LOG_DIR/hardware-scenarios-summary.log"
    echo "  $LOG_DIR/hardware-property-markers.log"
    if [[ $overall -ne 0 ]]; then
      echo "RESULT: FAILURE (required property markers missing)"
      exit 1
    fi
    echo "RESULT: SUCCESS (all required property markers emitted)"
    exit 0
  fi

  # Single scenario mode.
  local name="$mode"
  duration="${2:-$DEFAULT_DURATION}"
  local row
  row="$(scenario_row "$name")" || {
    echo "ERROR: unknown scenario: $name" >&2
    echo "Known scenarios:" >&2
    list_scenarios >&2
    exit 2
  }
  check_environment
  IFS='|' read -r _name temp hum light motion required <<< "$row"
  echo "=== $name (temp=$temp humidity=$hum light=$light motion=$motion) ==="
  run_scenario "$name" "$temp" "$hum" "$light" "$motion" "$required" "$duration"
}

main "$@"
