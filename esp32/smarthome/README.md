# ESP32 Smart-Home Hardware Case Study

This directory is the ESP32 hardware case study for the ReLico paper,
recreated on the new Lean translation pipeline. It demonstrates the full
deployment path from a Timed Rebeca model, through the verified Lean
translation, to an executable Lingua Franca program that observes the
five paper properties at runtime under controlled (virtual hardware)
sensor input.

## Claim boundaries

Three distinct evidence classes exist in this case study. They must not
be conflated:

| Statement | True? |
|---|---|
| **formal evidence ≠ runtime evidence** — the Lean translation theorem and its checksum-pinned LF artifact are formal evidence; the scenario logs are runtime evidence produced by the deployment artifact | yes, they are different artifacts with different guarantees |
| **runtime evidence ≠ correctness proof** — emitted `[PROPERTY]` markers are runtime observations at instrumented transition points, not a proof that the properties hold in all executions | correct |
| **deployment ≠ formal verification** — `hardware/smarthome.lf` contains a sensor I/O adaptation layer and observation markers that are **outside** the verified translation boundary | correct |

What is verified (Lean): the Timed Rebeca → LF translation itself.

What is trusted, not verified: the parser/export bridge, `lfc`, the
generated C++, the reactor-cpp runtime, the OS/hardware.

## Directory layout

```text
esp32/smarthome/
├── source/model.rebeca           Timed Rebeca source model
├── model.json                    JSON representation (parser output)
├── generated/                    FORMAL ARTIFACTS — immutable
│   ├── TranslatedLFProgram.lf    Lean translation output (checksum-pinned)
│   ├── model.txt                 decoded DTR AST dump (Lean export)
│   └── program.txt               translated LF AST dump (Lean export)
├── hardware/
│   ├── smarthome.lf              DEPLOYMENT artifact (sensor I/O + markers)
│   └── tests/                    property-marker and sensor-I/O tests
├── firmware/                     ESP32 firmware (PlatformIO, live-hardware path)
├── bridge/                       serial bridge + tests (ESP32 → sensor_data.jsonl)
├── scenario/
│   ├── run_virtual_hardware.sh   virtual hardware runner (marker validation)
│   └── tests/                    scenario definition + integration tests
├── sample_data/sensor_data.jsonl example bridge output (100 records)
├── logs/                         runtime evidence from executed scenarios
├── property/smarthome-runtime.property  the five assertion properties
├── images/                       hardware setup photograph
└── docs/                         stage documentation (see below)
```

## Formal artifact vs deployment artifact

**Formal artifact — `generated/TranslatedLFProgram.lf`**

- SHA-256: `e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9`
- Byte-identical to
  `benchmarks/general--smarthome-case-study--positive/expected/lf-source/TranslatedLFProgram.lf`
- Produced by the verified Lean translation; **never modify**
- Integrity is enforced by tests (`hardware/tests/`)

**Deployment artifact — `hardware/smarthome.lf`**

- Same reactor/port/connection topology as the formal artifact
  (verified by tests)
- Adds only the deployment adaptation layer:
  - sensor input helpers reading `sensor_data.jsonl`
    (`read_sensor_temperature`, `read_sensor_light`,
    `read_sensor_motion`)
  - runtime observation markers (`[PROPERTY]`, `[INFO]`)
- **Not formally verified**; its runtime behavior is evidence, not proof

## Build

Requires: `lfc` 0.11.0 and a C++ toolchain. From the repository root:

```bash
lfc esp32/smarthome/hardware/smarthome.lf
```

This produces `bin/smarthome` plus runtime libraries in `lib/` at the
repository root (untracked build outputs; see
`docs/ARTIFACT_REPRODUCTION.md`).

## Virtual hardware execution

```bash
esp32/smarthome/scenario/run_virtual_hardware.sh --all
```

Runs all five scenarios, writes logs to `logs/hardware-scenarios/`,
regenerates the summary logs, and exits non-zero if any required
property marker is missing. Single scenarios and options:

```bash
esp32/smarthome/scenario/run_virtual_hardware.sh --list
esp32/smarthome/scenario/run_virtual_hardware.sh scenario-3-fire-overrides-intrusion
```

Each log starts with a provenance header (date, scenario input, binary,
hardware-LF checksum, evidence-role statement).

## Tests

Requires Python 3 with `pytest`. From the repository root:

```bash
python3 -m pytest esp32/smarthome/hardware/tests/ \
                  esp32/smarthome/bridge/tests/ \
                  esp32/smarthome/scenario/tests/ -v
```

78 tests across four suites:

| Suite | Tests | Verifies |
|---|---:|---|
| `hardware/tests/test_property_markers.py` | 9 | marker validity, formal artifact integrity (checksum), structure preservation |
| `hardware/tests/test_sensor_io.py` | 24 | sensor helpers, hardcoded-value removal, formal artifact integrity |
| `bridge/tests/test_serial_bridge.py` | 32 | serial JSON parsing, jsonl generation, malformed input, LF-helper compatibility |
| `scenario/tests/test_scenarios.py` | 13 | scenario table, plus integration tests that execute all five scenarios through the runner |

Scenario integration tests are skipped automatically when the compiled
LF binary is not present or older than `hardware/smarthome.lf`.

## Scenarios

Sensor encoding: `light` 0 = bright / 1 = dark; `motion` 0 = none /
1 = detected; temperature in °C (int-truncated by the sensor helper).

| Scenario | Input (temp/humidity/light/motion) | Expected observation |
|---|---|---|
| 1 fire-emergency | 38 / 40 / 0 / 0 | fire alert opens the door, heater forced off, emergency mode with fire alarm |
| 2 intrusion-stealth | 24 / 40 / 1 / 1 | intrusion alarm, light override keeps the light off |
| 3 fire-overrides-intrusion | 38 / 40 / 1 / 1 | fire wins the same-tag race: intrusion alerts ignored, door stays open, heater off |
| 4 normal-baseline | 27 / 40 / 0 / 0 | no alarms, no property markers (negative check) |
| 5 cold-temperature | 18 / 40 / 0 / 0 | heater on, no alarms, no property markers (negative check) |

Scenarios 4 and 5 are baselines: the runner **fails** if they emit any
property marker.

## Evidence interpretation

- `logs/hardware-scenarios/*.log` — one log per scenario: provenance
  header + runtime marker trace from the deployment binary.
- `logs/hardware-scenarios-summary.log` — marker excerpts of all five
  logs.
- `logs/hardware-property-markers.log` — every `[PROPERTY]` line,
  grouped per log file.

A `[PROPERTY] Name: ...` line means: *the instrumented reaction observed
the named property condition at that transition*. It does **not** mean
the property was proven. Per-cycle marker counts scale with the run
duration (sensors sample at 1 s); the exact count is timing-dependent.

The five properties are declared in
`property/smarthome-runtime.property` and mapped to observation points
in `docs/PROPERTY_OBSERVATION_MAPPING.md`.

## Live ESP32 path (optional, not part of the recorded evidence)

The firmware (`firmware/`) and serial bridge (`bridge/`) implement the
physical path: ESP32 samples DHT22/LDR/PIR at 1 Hz and emits one JSON
record per serial line; the bridge rewrites `sensor_data.jsonl`, the
same file interface consumed by the virtual runner. All evidence
committed under `logs/` was produced by the virtual hardware path; no
live-hardware execution on the new pipeline is claimed. See
`bridge/serial_bridge.py` and `docs/ARTIFACT_REPRODUCTION.md`.

## Documentation index

| Document | Content |
|---|---|
| `docs/ARTIFACT_REPRODUCTION.md` | exact commands to reproduce every artifact and result |
| `docs/ARTIFACT_INVENTORY.md` | complete file inventory with evidence roles |
| `docs/ARTIFACT_REPRODUCTION.md` | commands and evidence needed to reproduce the runtime artifact |
| `docs/PROPERTY_OBSERVATION_MAPPING.md` | property → observation point mapping |


## Relation to the benchmark

The pipeline artifacts of this case study are checksum-identical to the
authoritative benchmark `benchmarks/general--smarthome-case-study--positive/`
(source, parser-json, decoded-dtr-ast, translated-lf-ast, lf-source
stages). See `docs/ARTIFACT_REPRODUCTION.md` for the checksum table.
