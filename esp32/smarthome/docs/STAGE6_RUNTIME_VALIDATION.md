# Stage 6: Virtual Hardware Execution Validation

This document records the virtual hardware execution validation of the
ESP32 smart-home case study on the new Lean translation pipeline.

Execution date: 2026-09-14
Platform: macOS (Apple Silicon)
LF compiler: lfc 0.11.0

## Claim boundaries

| Statement | Status |
|---|---|
| Formal evidence (Lean translation, `esp32/smarthome/generated/TranslatedLFProgram.lf`, SHA-256 `e011fc67...62cd9`) is unaffected by this stage | verified below |
| Runtime evidence is **not** formal evidence | acknowledged |
| Runtime marker observation is **not** a correctness proof | acknowledged |
| Deployment execution is **not** formal verification | acknowledged |
| The hardware LF (`esp32/smarthome/hardware/smarthome.lf`) is a deployment artifact with sensor I/O and observation markers; it is **not** formally verified | acknowledged |

All logs below were produced by the **new** pipeline (Lean-translated
structure + hardware adaptation layer). No log from the old
`esp32-old/` workflow is reused as evidence.

## What was executed

### Deployment artifact

`esp32/smarthome/hardware/smarthome.lf` — built from the Lean-translated
structure (reactors, ports, connections preserved; verified by the Stage 3
test suite) plus the deployment-only adaptation layer:

- sensor input helpers reading `sensor_data.jsonl`
  (`read_sensor_temperature`, `read_sensor_light`, `read_sensor_motion`)
- runtime observation markers (`[PROPERTY]`, `[INFO]`)

### Build command

From the repository root:

```bash
lfc esp32/smarthome/hardware/smarthome.lf
```

This produces `bin/smarthome` and `lib/` at the repository root.

### Execution command

```bash
esp32/smarthome/scenario/run_virtual_hardware.sh --all
```

The runner:

1. prepares a controlled sensor record in an isolated temporary
   directory (one JSON line, same file interface as the live serial
   bridge),
2. executes the hardware LF binary for 5 seconds per scenario,
3. captures stdout into `esp32/smarthome/logs/hardware-scenarios/`,
4. validates that every required property marker for the scenario was
   emitted (and that baseline scenarios emit none),
5. exits non-zero if any required marker is missing or if any
   malformed marker line is detected.

Single scenarios can be run with
`run_virtual_hardware.sh <scenario-name> [duration-seconds]`;
`run_virtual_hardware.sh --list` prints the scenario table.

## Scenario definitions

Sensor encoding: `light` 0 = bright / 1 = dark, `motion` 0 = none /
1 = detected (documented encoding of the old workflow; both old and new
LF code implement `light > 0 → dark`).

| Scenario | temp | humidity | light | motion | Required property markers |
|---|---:|---:|---:|---:|---|
| scenario-1-fire-emergency | 38.0 | 40.0 | 0 | 0 | FireKeepsDoorOpen, HeaterOffDuringFire, EmergencyImpliesAlarmOrHistory |
| scenario-2-intrusion-stealth | 24.0 | 40.0 | 1 | 1 | EmergencyImpliesAlarmOrHistory, LightOffDuringIntrusionOverride |
| scenario-3-fire-overrides-intrusion | 38.0 | 40.0 | 1 | 1 | FireKeepsDoorOpen, FireOverridesIntrusion, HeaterOffDuringFire, EmergencyImpliesAlarmOrHistory |
| scenario-4-normal-baseline | 27.0 | 40.0 | 0 | 0 | (none — baseline) |
| scenario-5-cold-temperature | 18.0 | 40.0 | 0 | 0 | (none — baseline) |

The required-marker sets follow the property-to-scenario mapping of the
old case study.

## Results

All five scenarios passed; every required property marker was emitted.

| Scenario | Result | Produced markers (occurrences) |
|---|---|---|
| scenario-1-fire-emergency | **PASS** | HeaterOffDuringFire ×5, FireKeepsDoorOpen ("door being OPENED") ×1, EmergencyImpliesAlarmOrHistory ("fireActive=true") ×1 |
| scenario-2-intrusion-stealth | **PASS** | EmergencyImpliesAlarmOrHistory ("intrusionActive=true") ×1, LightOffDuringIntrusionOverride ×5 (1 × "lightIsOn=false", 4 × "ignoring light update") |
| scenario-3-fire-overrides-intrusion | **PASS** | HeaterOffDuringFire ×5, FireKeepsDoorOpen ×6 (1 × "door being OPENED", 5 × "door remains OPEN"), FireOverridesIntrusion ×5 ("intrusion alert IGNORED"), EmergencyImpliesAlarmOrHistory ×1 ("fireActive=true"), [INFO] "Unwanted person alert IGNORED (fire is active)" ×5 |
| scenario-4-normal-baseline | **PASS** | none (no property markers, as expected for the baseline) |
| scenario-5-cold-temperature | **PASS** | none (no property markers, as expected for the baseline) |

Marker validation: 30 `[PROPERTY]` lines total across all scenario logs;
all marker lines well-formed (`[EVENT] `/`[INFO] `/`[PROPERTY] ` with
non-empty text); no malformed marker lines detected.

> Stage 7 note: the logs were regenerated on 2026-09-13/14 with a
> provenance header prepended to each scenario log (date, scenario
> input, binary, hardware-LF checksum, evidence-role statement). The
> marker sets and counts below are unchanged.

Evidence files:

```text
esp32/smarthome/logs/hardware-scenarios/scenario-1-fire-emergency.log
esp32/smarthome/logs/hardware-scenarios/scenario-2-intrusion-stealth.log
esp32/smarthome/logs/hardware-scenarios/scenario-3-fire-overrides-intrusion.log
esp32/smarthome/logs/hardware-scenarios/scenario-4-normal-baseline.log
esp32/smarthome/logs/hardware-scenarios/scenario-5-cold-temperature.log
esp32/smarthome/logs/hardware-scenarios-summary.log
esp32/smarthome/logs/hardware-property-markers.log
```

### Race-order note for scenario 3

Fire and intrusion alerts arrive at `CentralController` at the same
logical tag. In the executed runs the fire alert was processed first, so
the observed `FireOverridesIntrusion` variant is "intrusion alert
IGNORED" (fire active, subsequent motion alerts dropped). The opposite
ordering is also observable in principle through the companion variant
"fireActive=true, intrusionActive=false" (fire clears an already active
intrusion alarm); both variants exist in the deployment artifact, so the
property is observable regardless of the race outcome.

## Stage 6 fixes to the observation layer

During Stage 6 inspection, three observation gaps were found in the
Stage 4 marker placement and fixed **in the deployment artifact only**
(no reactor, port, connection, timing, or control-flow changes; the
formal artifact was not touched):

1. `HeaterOffDuringFire` was placed only in `tempUpdate_action`, which
   is never scheduled at runtime (the live TempSensor path is the
   `tempUpdateToRcFromTs1` port input). The marker was added to the
   port-input reaction.
2. `EmergencyImpliesAlarmOrHistory` lacked the fire variant, so
   scenario 1 could not emit it. The marker was added where fire sets
   `emergencyModeActive`.
3. `FireOverridesIntrusion` lacked the intrusion-ignored variant, so
   the fire-first race ordering in scenario 3 produced no marker. The
   observation (plus one `[INFO]` line and a "door remains OPEN"
   `FireKeepsDoorOpen` observation) was added to the branch where an
   unwanted person alert is dropped because fire is active.

The stale `logs/` content (byte-identical copies of old-pipeline logs
from `esp32-old/`) was removed and replaced with the new-pipeline
evidence listed above. The old `scenario/run_scenario.sh` copy (wrong
output paths for the new layout, no marker validation) was replaced by
`run_virtual_hardware.sh`.

## Bridge validation

`esp32/smarthome/bridge/serial_bridge.py` was refactored into testable
functions with the bridge protocol unchanged (JSON-per-line serial
records, `timestamp` attachment, 100-record ring buffer, full-file
rewrite, malformed lines skipped). pyserial is stubbed in tests, so no
serial hardware is required.

`esp32/smarthome/bridge/tests/test_serial_bridge.py` covers:

- serial JSON parsing (valid, empty, non-JSON, malformed, non-object)
- `sensor_data.jsonl` generation (one JSON per line, latest record last,
  ring buffer cap of 100, rewrite-not-append)
- malformed input handling in the bridge loop (bad lines skipped)
- compatibility with the LF sensor helpers (last-line selection,
  `"key":` lookup, `atoi` value parsing, missing-field fallbacks,
  boolean conversion, temperature threshold boundaries)

The live ESP32 serial path itself was **not** exercised in Stage 6
(no physical hardware was used and no live-hardware claim is made).

## Test suite

All 78 tests pass (Python 3.11):

```text
esp32/smarthome/hardware/tests/test_property_markers.py   (Stage 4, updated)
esp32/smarthome/hardware/tests/test_sensor_io.py          (Stage 5)
esp32/smarthome/bridge/tests/test_serial_bridge.py        (Stage 6, new)
esp32/smarthome/scenario/tests/test_scenarios.py          (Stage 6, new)
```

The scenario tests include integration tests that execute all five
scenarios through the runner (skipped automatically when the compiled LF
binary is unavailable).

## Differences from esp32-old

| Aspect | esp32-old | New pipeline (Stage 6) |
|---|---|---|
| LF origin | hand-adapted from old Java-translator output (`generated_smarthome.lf`) | deployment LF derived from the Lean-verified translation (structure verified by tests; formal artifact checksum-pinned) |
| Port types | struct-typed messages (`RoomController_tempUpdate{t}`, ...) | plain `int`/`bool` ports as produced by the Lean translation |
| Marker vocabulary | full `[EVENT]`/`[INFO]`/`[PROPERTY]` control-flow trace (43 marker kinds) | observation-focused: 19 `[PROPERTY]` occurrences + 1 `[INFO]` line; no per-event control-flow trace |
| Property variants | 3 `EmergencyImpliesAlarmOrHistory` variants (incl. `intrusionCleared=true`), `HeaterOffDuringFire` via float parse | 2 variants (intrusion, fire); the 30 s intrusion auto-clear path exists but is not marked (runs beyond the 5 s scenario window anyway); temperature is int (`atoi`) — fractional values truncate (35.5 → 35, no fire) because the translated model carries `int` temperatures |
| Logs | recorded from live ESP32 runs + replay on the old pipeline | virtual-hardware replay only (controlled `sensor_data.jsonl` input, same file interface as the bridge) |
| Runner | `run_scenario.sh`: writes into CWD, fixed relative output dir, no validation | `run_virtual_hardware.sh`: isolated work dir, canonical log dir, per-scenario required-marker validation, malformed-marker detection, stale-binary guard, non-zero exit on failure |
| Old-artifact quirk | committed old logs show DARK for `light=0` scenarios (inverted vs. the old README's encoding) | new runs use the documented encoding (0 = bright, 1 = dark), consistent with both old and new LF code |
| Bridge | untested monolithic script | same protocol, refactored into testable functions, 32 tests with stubbed pyserial |

## Remaining issues before paper update

1. **No live ESP32 execution on the new pipeline.** All new evidence is
   virtual-hardware replay. If the paper wants to claim live ESP32
   execution on the new pipeline, a physical run is still needed; the
   firmware (`esp32/smarthome/firmware/`) and bridge are prepared for it.
2. **Unmarked intrusion auto-clear.** The 30-second
   `clearIntrusionAlarm` path has no observation marker (the old
   `intrusionCleared=true` variant is not reproduced). Scenarios would
   need to run ≥ 30 s to observe it.
3. **Int temperature semantics.** The translated model's `int`
   temperature ports make fractional sensor readings truncate
   (`35.5 → 35`, no fire alert). The paper should either state this as a
   modeling abstraction or the scenarios should use integer-valued
   inputs (they do).
4. **Marker vocabulary is smaller than the old artifact.** The new
   deployment LF emits property-focused evidence, not the old full
   event trace. The paper text should not promise `[EVENT]`-level
   control-flow traces from the new pipeline.
5. **Binary provenance.** `bin/smarthome`, `lib/`, `src-gen/`, etc. at
   the repository root are local lfc build outputs (untracked); the
   documented one-line build command reproduces them.
