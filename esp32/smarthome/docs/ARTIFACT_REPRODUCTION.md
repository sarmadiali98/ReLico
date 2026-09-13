# Artifact Reproduction

Exact commands to reproduce every artifact and result of the ESP32
smart-home case study. All commands run from the repository root
(`/Users/ali/Desktop/ReLico` in the recorded runs; any clone works with
the paths adjusted accordingly).

Tool versions used in the recorded runs:

| Tool | Version |
|---|---|
| lfc | 0.11.0 (`/Users/ali/.local/bin/lfc`) |
| Python + pytest | Python 3.11.6, pytest 9.1.1 (`/opt/homebrew/bin/python3.11`) |
| lake | at `/Users/ali/.elan/bin/lake` (Lean 4) |
| macOS | Apple Silicon |

## 1. Formal artifact: generate and check

The formal artifact is produced by the verified Lean translation. Its
authoritative copy is the benchmark expected artifact; the case-study
copy must stay byte-identical.

### Check integrity (no rebuild)

```bash
shasum -a 256 esp32/smarthome/generated/TranslatedLFProgram.lf
# expected:
# e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9

diff esp32/smarthome/generated/TranslatedLFProgram.lf \
     benchmarks/general--smarthome-case-study--positive/expected/lf-source/TranslatedLFProgram.lf
# expected: no output (byte-identical)
```

The same check runs inside the test suite:

```bash
/opt/homebrew/bin/python3.11 -m pytest \
  esp32/smarthome/hardware/tests/test_property_markers.py \
  esp32/smarthome/hardware/tests/test_sensor_io.py -v
```

### Regenerate the pipeline artifacts ( Lean export)

The full chain is `model.rebeca → model.json → model.txt → program.txt
→ TranslatedLFProgram.lf`, executed by `tools/relico_bench_stage.py`
with the Lean toolchain. The authoritative stage commands (from the
benchmark manifest) are:

```bash
# 0. (optional) parser stage: model.rebeca -> model.json
#    requires the parser artifact zip and Maven; see the benchmark
#    manifest for the exact invocation
/opt/homebrew/bin/python3.11 tools/relico_bench_stage.py parser-json \
  --family general --repo . \
  --source benchmarks/general--smarthome-case-study--positive/source/model.rebeca \
  --actual <work-dir> \
  --artifact-zip <parser-artifact.zip> --maven <mvn> \
  --output <work-dir>/parser-json/model.json

# 1. decoded DTR AST: model.json -> model.txt
/opt/homebrew/bin/python3.11 tools/relico_bench_stage.py lean-export \
  --family general --mode decoded-dtr-ast --repo . \
  --lake /Users/ali/.elan/bin/lake \
  --input <work-dir>/parser-json/model.json \
  --output <work-dir>/decoded-dtr-ast/model.txt

# 2. translated LF AST: model.json -> program.txt
/opt/homebrew/bin/python3.11 tools/relico_bench_stage.py lean-export \
  --family general --mode translated-lf-ast --repo . \
  --lake /Users/ali/.elan/bin/lake \
  --input <work-dir>/parser-json/model.json \
  --output <work-dir>/translated-lf-ast/program.txt

# 3. LF source: model.json -> TranslatedLFProgram.lf
/opt/homebrew/bin/python3.11 tools/relico_bench_stage.py lean-export \
  --family general --mode lf-source --repo . \
  --lake /Users/ali/.elan/bin/lake \
  --input <work-dir>/parser-json/model.json \
  --output <work-dir>/lf-source/TranslatedLFProgram.lf
```

The Lean export stages run the Lean code through `lake`; they require
`lake build` to pass on the repository (no `sorry`, no axioms — enforced
by the repository rules).

The end-to-end benchmark (all nine stages, including RMC and runtime)
can be executed through the benchmark runner:

```bash
/opt/homebrew/bin/python3.11 tools/relico_bench.py --show general--smarthome-case-study--positive
/opt/homebrew/bin/python3.11 tools/relico_bench.py --benchmark general--smarthome-case-study--positive
```

This re-runs source, RMC, parser-json, the three Lean export stages,
lfc, and the runtime observation stage against the benchmark copy of
the model and compares them with the committed expected artifacts.

### Checksum table (case-study copy vs benchmark expected)

| Stage artifact | Case-study path | Benchmark expected path | SHA-256 (both) |
|---|---|---|---|
| source | `esp32/smarthome/source/model.rebeca` | `benchmarks/.../source/model.rebeca` | `8913c2b92557ff025729c4aa92ba61b687d7349535c159da206b94dc5fa93566` |
| parser-json | `esp32/smarthome/model.json` | `benchmarks/.../expected/parser-json/model.json` | `2f51436b6ed742d21c9431234a2413ac65e9077294a886f327d58b4d797fe6d3` |
| decoded-dtr-ast | `esp32/smarthome/generated/model.txt` | `benchmarks/.../expected/decoded-dtr-ast/model.txt` | `201a541e53d6c1b508373d066af239e7a9a7fa0b4e98e719d15447d07437fa20` |
| translated-lf-ast | `esp32/smarthome/generated/program.txt` | `benchmarks/.../expected/translated-lf-ast/program.txt` | `3bdbd094993f2d188fb2db3f1a69f0839390bdd60bb4e4e258e381875f752b54` |
| lf-source | `esp32/smarthome/generated/TranslatedLFProgram.lf` | `benchmarks/.../expected/lf-source/TranslatedLFProgram.lf` | `e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9` |

Verified 2026-09-14: all five pairs byte-identical.

## 2. Deployment artifact: compile

```bash
lfc esp32/smarthome/hardware/smarthome.lf
```

- exit code 0 on the recorded run (one benign `unused variable 'msg'`
  warning from an untouched translated reaction)
- outputs at the repository root (untracked build outputs):
  `bin/smarthome`, `lib/`, `include/`, `share/`, `src-gen/`
- the binary links `@rpath/libreactor-cpp-default.1.dylib`; the runner
  sets `DYLD_LIBRARY_PATH` to the repository-root `lib/`
- the runner refuses to execute a binary older than
  `hardware/smarthome.lf` (stale-build guard)

Deployment artifact checksum for cross-checking logs:

```bash
shasum -a 256 esp32/smarthome/hardware/smarthome.lf
# recorded value at evidence time:
# c583b12e98fb09cb8d892406f44e362b6d2de4be60f3b98542fc07057e9a785d
```

This file is modifiable **only** within the deployment-adaptation
boundary (sensor helpers + observation markers); reactor/port/connection
topology must stay aligned with the formal artifact (enforced by
`hardware/tests/`).

## 3. Run tests

```bash
/opt/homebrew/bin/python3.11 -m pytest \
  esp32/smarthome/hardware/tests/ \
  esp32/smarthome/bridge/tests/ \
  esp32/smarthome/scenario/tests/ -v
```

Recorded result: **78 passed** (9 + 24 hardware, 32 bridge, 13 scenario).
The scenario suite includes integration tests that execute all five
scenarios through the runner; they are skipped automatically when
`bin/smarthome` is missing or older than the hardware LF.

The bridge tests stub pyserial; no serial hardware and no pyserial
installation are required.

## 4. Run scenarios (virtual hardware)

```bash
esp32/smarthome/scenario/run_virtual_hardware.sh --all
```

Recorded result: `RESULT: SUCCESS (all required property markers
emitted)`, exit 0. Runtime: ~5 s per scenario (default duration), plus
log regeneration.

Single scenario:

```bash
esp32/smarthome/scenario/run_virtual_hardware.sh scenario-3-fire-overrides-intrusion
esp32/smarthome/scenario/run_virtual_hardware.sh scenario-3-fire-overrides-intrusion 10   # 10 s
```

Environment overrides (all optional):

```bash
LOG_DIR=<dir>        # log output directory (default: esp32/smarthome/logs)
SMARTHOME_BIN=<path> # compiled LF binary (default: <repo>/bin/smarthome)
SMARTHOME_LIB=<dir>  # reactor-cpp library dir (default: <repo>/lib)
```

Failure behavior (verified): exit 1 when a required property marker is
missing, exit 1 on malformed marker lines, exit 1 when a baseline
scenario emits property markers, exit 2 for unknown scenarios / missing
or stale binary.

## 5. Collect logs

The runner writes:

```text
esp32/smarthome/logs/hardware-scenarios/<scenario>.log   raw evidence per scenario
esp32/smarthome/logs/hardware-scenarios-summary.log      marker excerpts, all scenarios
esp32/smarthome/logs/hardware-property-markers.log       every [PROPERTY] line per log
```

Each scenario log starts with a provenance header:

```text
# virtual-hardware scenario: <name>
# date: <UTC timestamp>
# input: temp=… humidity=… light=… motion=… duration=…
# binary: <path> (built from esp32/smarthome/hardware/smarthome.lf)
# hardware-lf-sha256: <sha256 of hardware/smarthome.lf>
# formal artifact: esp32/smarthome/generated/TranslatedLFProgram.lf (immutable, not executed here)
# evidence role: runtime observation only, not a correctness proof
```

To re-verify committed evidence without re-running:

```bash
grep -c "^\[PROPERTY\]" esp32/smarthome/logs/hardware-scenarios/*.log
grep -R "FireKeepsDoorOpen\|FireOverridesIntrusion\|HeaterOffDuringFire\|EmergencyImpliesAlarmOrHistory\|LightOffDuringIntrusionOverride" \
  esp32/smarthome/logs/hardware-scenarios
```

## 6. Live hardware path (optional, not part of the recorded evidence)

For completeness — this path exists but was **not** executed for the
committed evidence (all committed logs are from the virtual runner):

```bash
# firmware: build + upload (PlatformIO)
cd esp32/smarthome/firmware
pio run && pio run -t upload
pio device monitor -b 115200        # one JSON record per second

# bridge: ESP32 serial -> sensor_data.jsonl
cd ../bridge
python3 -m pip install pyserial      # if needed
python3 serial_bridge.py             # edit PORT for your machine
```

## Notes and caveats

- `bin/`, `lib/`, `include/`, `share/`, `src-gen/` at the repository
  root are lfc build outputs — regenerable with the command in section 2.
- The repository `.gitignore` ignores `generated/` and `*.log`
  globally. The formal artifact (`esp32/smarthome/generated/`) and the
  runtime evidence (`esp32/smarthome/logs/`) therefore require an
  explicit force-add when committing:
  `git add -f esp32/smarthome/generated/ esp32/smarthome/logs/`
- Marker counts per scenario scale with the run duration (sensors
  sample at 1 s); exact counts are timing-dependent. The required-marker
  *sets* are duration-independent and are what the runner validates.
- Scenario 3 involves a same-tag race between fire and intrusion alerts;
  the deployment artifact contains observation variants for **both**
  orderings, so the required markers appear regardless of the race
  outcome (recorded runs show the fire-first ordering).
