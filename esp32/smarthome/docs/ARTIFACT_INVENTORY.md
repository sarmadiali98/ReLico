# Artifact Inventory

Complete inventory of the ESP32 smart-home case study artifact
(`esp32/smarthome/`), with evidence roles and modification policy.

Modifiability legend:

- **NO** — immutable for the paper; changes invalidate the evidence
- **constrained** — modifiable only within the documented boundary
- **YES** — freely modifiable; regenerate or re-run as needed

## Formal pipeline artifacts

| File | Purpose | Origin | Modifiable? | Evidence role |
|---|---|---|---|---|
| `source/model.rebeca` | Timed Rebeca source model | benchmark source (SHA-256 `8913c2b9…93566`, byte-identical to `benchmarks/general--smarthome-case-study--positive/source/model.rebeca`) | NO | source of the translation chain |
| `model.json` | JSON representation (parser stage output) | parser stage; byte-identical to benchmark `expected/parser-json/model.json` (SHA-256 `2f51436b…fe6d3`) | NO | parser-stage evidence |
| `generated/model.txt` | decoded DTR AST dump | Lean export (`lean-export --mode decoded-dtr-ast`); byte-identical to benchmark `expected/decoded-dtr-ast/model.txt` (SHA-256 `201a541e…7fa20`) | NO | Lean decoding evidence |
| `generated/program.txt` | translated LF AST dump | Lean export (`lean-export --mode translated-lf-ast`); byte-identical to benchmark `expected/translated-lf-ast/program.txt` (SHA-256 `3bdbd094…52b54`) | NO | Lean translation AST evidence |
| `generated/TranslatedLFProgram.lf` | **THE formal artifact**: Lean translation output | Lean export (`lean-export --mode lf-source`); SHA-256 `e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9`, byte-identical to benchmark `expected/lf-source/TranslatedLFProgram.lf` | **NO — never modify** | **formal evidence** (verified translation output) |

The five checksums above were verified identical to their benchmark
counterparts on 2026-09-14 (see `ARTIFACT_REPRODUCTION.md` for the
checksum table and the regeneration commands).

## Deployment artifact

| File | Purpose | Origin | Modifiable? | Evidence role |
|---|---|---|---|---|
| `hardware/smarthome.lf` | deployment LF: translated topology + sensor I/O helpers + observation markers | derived from `generated/TranslatedLFProgram.lf` (Stages 3–6) | constrained: sensor helpers and observation markers only; reactor/port/connection topology must stay aligned with the formal artifact (enforced by `hardware/tests/`) | executed to produce runtime evidence; itself **not** formal evidence (SHA-256 at evidence time: `c583b12e…a785d`) |

## Tests

| File | Tests | Purpose | Modifiable? | Evidence role |
|---|---:|---|---|---|
| `hardware/tests/test_property_markers.py` | 9 | marker validity (19 `[PROPERTY]` occurrences), formal-artifact checksum + purity, structure preservation | YES (within test semantics) | protects the formal/deployment boundary |
| `hardware/tests/test_sensor_io.py` | 24 | sensor helpers used, hardcoded values removed, JSON keys, missing-field fallbacks, thresholds, formal-artifact integrity | YES | protects the sensor adaptation layer |
| `bridge/tests/test_serial_bridge.py` | 32 | serial JSON parsing, jsonl generation (ring buffer, rewrite), malformed input, LF-helper compatibility | YES | validates the bridge protocol |
| `scenario/tests/test_scenarios.py` | 13 | scenario table consistency + integration execution of all five scenarios | YES | validates the runner and required-marker mapping |

## Scenario execution

| File | Purpose | Origin | Modifiable? | Evidence role |
|---|---|---|---|---|
| `scenario/run_virtual_hardware.sh` | virtual hardware runner: prepare input → execute binary → capture log → validate required markers → regenerate summaries | Stage 6 | YES (scenario table changes must update `scenario/tests/` and docs) | produces and validates runtime evidence |
| `sample_data/sensor_data.jsonl` | example bridge output (100 records) for manual experiments | recorded bridge run (old workflow) | YES | illustrative only, not scenario evidence |

## Runtime evidence

All produced by `run_virtual_hardware.sh` from
`hardware/smarthome.lf` on 2026-09-13/14 (per-log provenance headers
record date, input, binary, and hardware-LF checksum).

| File | Purpose | Origin | Modifiable? | Evidence role |
|---|---|---|---|---|
| `logs/hardware-scenarios/scenario-1-fire-emergency.log` | fire scenario trace | runner | NO (regenerate via runner, do not hand-edit) | runtime evidence |
| `logs/hardware-scenarios/scenario-2-intrusion-stealth.log` | intrusion scenario trace | runner | NO (same) | runtime evidence |
| `logs/hardware-scenarios/scenario-3-fire-overrides-intrusion.log` | fire+intrusion race scenario trace | runner | NO (same) | runtime evidence |
| `logs/hardware-scenarios/scenario-4-normal-baseline.log` | baseline (no markers expected) | runner | NO (same) | negative-control runtime evidence |
| `logs/hardware-scenarios/scenario-5-cold-temperature.log` | cold scenario (no markers expected) | runner | NO (same) | negative-control runtime evidence |
| `logs/hardware-scenarios-summary.log` | marker excerpts, all scenarios | runner regeneration | regenerate only | derived evidence index |
| `logs/hardware-property-markers.log` | every `[PROPERTY]` line per log | runner regeneration | regenerate only | derived evidence index |

## Property specification

| File | Purpose | Origin | Modifiable? | Evidence role |
|---|---|---|---|---|
| `property/smarthome-runtime.property` | the five assertion properties (`FireKeepsDoorOpen`, `FireOverridesIntrusion`, `HeaterOffDuringFire`, `EmergencyImpliesAlarmOrHistory`, `LightOffDuringIntrusionOverride`) | old case study, carried over | NO | defines what the runtime markers refer to; source-level assertions, not pipeline-proved |

## Live-hardware path (not part of the recorded evidence)

| File | Purpose | Origin | Modifiable? | Evidence role |
|---|---|---|---|---|
| `firmware/platformio.ini` | PlatformIO config (`esp32dev`, DHT/UnifiedSensor deps) | old workflow | YES | enables live ESP32 runs |
| `firmware/src/main.cpp` | firmware: samples DHT22/LDR/PIR at 1 Hz, emits one JSON record per serial line | old workflow | YES | enables live ESP32 runs |
| `bridge/serial_bridge.py` | serial bridge: JSON-per-line → `sensor_data.jsonl` (100-record ring buffer) | old protocol, refactored + tested (Stage 6) | YES | enables live ESP32 runs; protocol identical to old workflow |
| `images/hardware-setup.png` | photograph of the ESP32 setup | old workflow | NO | hardware documentation |

## Documentation

| File | Purpose | Modifiable? |
|---|---|---|
| `README.md` | entry point: purpose, boundaries, commands, scenarios, evidence interpretation | YES |
| `docs/ARTIFACT_REPRODUCTION.md` | exact reproduction commands + checksum table | YES |
| `docs/ARTIFACT_INVENTORY.md` | this inventory | YES |
| `docs/STAGE6_RUNTIME_VALIDATION.md` | Stage 6 execution record and results | YES |
| `docs/PROPERTY_OBSERVATION_MAPPING.md` | property → observation point mapping in the deployment LF | YES |
| `docs/MIGRATION_MAPPING.md` | migration from the old ESP32 workflow, stage history | YES |

## Build outputs (not part of the artifact, regenerable)

Produced by `lfc esp32/smarthome/hardware/smarthome.lf` at the
repository root; untracked:

| Path | Purpose |
|---|---|
| `bin/smarthome` | deployment binary executed by the runner |
| `lib/`, `include/`, `share/` | reactor-cpp runtime for the binary |
| `src-gen/` | generated C++ sources |

## Packaging note (git)

The repository `.gitignore` ignores `generated/` and `*.log` globally.
Committing this artifact therefore requires explicit force-adds:

```bash
git add -f esp32/smarthome/generated/TranslatedLFProgram.lf \
           esp32/smarthome/generated/model.txt \
           esp32/smarthome/generated/program.txt
git add -f esp32/smarthome/logs/
```

All other case-study files are covered by normal explicit adds. Never
use `git add -A` (repository rule).
