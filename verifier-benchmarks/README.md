# Verification Benchmarks: Lingua Franca vs Timed Rebeca

This directory contains the verification-oriented benchmark material used in the ReLico evaluation.

Its purpose is to support a comparison between equivalent **Timed Rebeca (TR)** and **Lingua Franca (LF)** models with respect to:

- verification outcome,
- verification time,
- verification artifact size,
- practical resource limits.

This directory is an **evaluation harness**, not the core ReLico translator itself.

## Recommended reviewer path

The recommended first check is the smoke-test workflow.

From the repository root:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
./scripts/run_smoke.sh
```

This checks that the required tools are available and then runs one representative benchmark through both verification workflows:

- `AircraftDoor` through the Timed Rebeca/RMC workflow,
- `AircraftDoor.lf` through the Lingua Franca/Uclid/Z3 workflow.

Expected smoke-test results:

- the TR/RMC CSV reports `analysis_result=satisfied`,
- the LF/Uclid/Z3 CSV reports `AircraftDoor,...,Valid,0,0,0,...`.

The smoke test is intentionally small. It is meant to confirm that the verifier toolchain is configured correctly before launching full benchmark reruns.

## Quick command summary

| Task | Command |
|---|---|
| Check environment | `./scripts/check_env.sh` |
| Run both smoke tests | `./scripts/run_smoke.sh` |
| Run TR/RMC smoke only | `./scripts/run_tr_smoke.sh` |
| Run LF/Uclid/Z3 smoke only | `./scripts/run_lf_smoke.sh` |
| Run all TR/RMC benchmarks | `cd TR && python3 tools/batch_rmc.py` |
| Run all LF/Uclid/Z3 benchmarks | `cd LF && ./scripts/run-benchmarks benchmarks` |

## Required tools

The smoke-test and full benchmark workflows require:

- `java`
- `javac`
- `python3`
- `c++`
- `lfc`
- `uclid`
- `z3`
- `rmc-2.14.jar`

The expected command names are:

```text
java
javac
python3
c++
lfc
uclid
z3
```

The RMC jar is checked separately at:

```text
TR/tools/rmc-2.14.jar
```

Run the environment checker with:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

If a tool is missing, install it or place it on your `PATH` before running the verifier workflows.

On macOS, if Uclid and Z3 are installed locally but not on `PATH`, add their directories before running the verifier scripts. For example:

```bash
export PATH="$HOME/uclid/target/universal/uclid-0.9.5/bin:$PATH"
export PATH="$HOME/uclid/z3/bin:$PATH"
export DYLD_LIBRARY_PATH="$HOME/uclid/z3/bin:${DYLD_LIBRARY_PATH:-}"
```

Then rerun:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

## RMC setup

The RMC jar is **not bundled in this repository**. It is an external tool.

To run the Timed Rebeca/RMC workflow, download `rmc-2.14.jar` and place it at:

```text
verifier-benchmarks/TR/tools/rmc-2.14.jar
```

From the repository root:

```bash
mkdir -p verifier-benchmarks/TR/tools

curl -L \
  -o verifier-benchmarks/TR/tools/rmc-2.14.jar \
  https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar
```

Or, from inside `verifier-benchmarks/`:

```bash
mkdir -p TR/tools

curl -L \
  -o TR/tools/rmc-2.14.jar \
  https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar
```

Verify that it is in place:

```bash
ls -lh verifier-benchmarks/TR/tools/rmc-2.14.jar
```

or, from inside `verifier-benchmarks/`:

```bash
ls -lh TR/tools/rmc-2.14.jar
```

The RMC jar used in our Ubuntu test had this SHA256 checksum:

```text
a39112046d99e0895cf47f890242ace21db896e609f7eef86751a0d416d477f5
```

To verify on Linux:

```bash
sha256sum verifier-benchmarks/TR/tools/rmc-2.14.jar
```

To verify on macOS:

```bash
shasum -a 256 verifier-benchmarks/TR/tools/rmc-2.14.jar
```

## Known-good environments

### Ubuntu

The included results and smoke-test validation were produced on:

- **Operating system:** Ubuntu 24.04.4 LTS
- **Machine:** Lenovo IdeaPad 5
- **Memory:** 8 GB RAM
- **Processor:** Intel Core i3-1115G4
- **Java/Javac:** 17.0.18
- **Python:** 3.12.3
- **Maven:** 3.9.9
- **Lingua Franca compiler (`lfc`):** 0.11.1-SNAPSHOT
- **Uclid:** 0.9.5
- **Z3:** 4.8.8
- **RMC:** 2.14

The TR and LF timing/resource numbers in the paper should be interpreted as being gathered under this hardware configuration.

### macOS

The verifier smoke test was also run on:

- macOS on Apple Silicon
- Java 21.0.1
- Maven 3.9.9
- Lingua Franca compiler (`lfc`) 0.11.0
- Uclid 0.9.5
- Z3 through the local Uclid/Z3 setup
- RMC 2.14

The macOS run is used as an additional smoke-test validation, not as the source of the paper timing table.

## Expected runtimes

These times are approximate and machine-dependent.

| Task | Command | Expected time |
|---|---|---:|
| Environment check | `./scripts/check_env.sh` | under 1 minute |
| Verifier smoke test | `./scripts/run_smoke.sh` | about 1 minute on the tested Ubuntu machine |
| TR/RMC smoke test only | `./scripts/run_tr_smoke.sh` | a few seconds on the tested Ubuntu machine |
| LF/Uclid/Z3 smoke test only | `./scripts/run_lf_smoke.sh` | about 15-30 seconds on the tested Ubuntu machine |
| Full TR/RMC benchmark rerun | `cd TR && python3 tools/batch_rmc.py` | several minutes, machine-dependent |
| Full LF/Uclid/Z3 benchmark rerun | `cd LF && ./scripts/run-benchmarks benchmarks` | several minutes; demanding cases may hit resource limits |

## Directory structure

```text
verifier-benchmarks/
├── README.md
├── scripts/
│   ├── check_env.sh
│   ├── run_lf_smoke.sh
│   ├── run_smoke.sh
│   └── run_tr_smoke.sh
├── LF/
│   ├── benchmarks/
│   │   └── src/
│   ├── env.bash
│   ├── results/
│   └── scripts/
│       └── run-benchmarks
└── TR/
    ├── sample_results.csv
    ├── src/
    │   ├── AircraftDoor/
    │   ├── Alarm/
    │   ├── CheckpointBarrier2/
    │   ├── Election/
    │   ├── Factorial/
    │   ├── Fibonacci/
    │   ├── Minimal/
    │   ├── PingPong/
    │   ├── Pipe/
    │   ├── ProcessMsg/
    │   ├── Ring/
    │   ├── SafeSend/
    │   ├── Subway/
    │   ├── Thermostat/
    │   ├── TrafficLight/
    │   ├── TrainDoor/
    │   ├── TrainDoor2/
    │   ├── TrainDoorFeedback/
    │   ├── UnsafeSend/
    │   └── WideBarrier24/
    └── tools/
        └── batch_rmc.py
```

## Smoke-test workflow

From the repository root:

```bash
cd verifier-benchmarks
./scripts/run_smoke.sh
```

The script performs three steps:

1. runs `scripts/check_env.sh`,
2. runs the TR/RMC `AircraftDoor` benchmark,
3. runs the LF/Uclid/Z3 `AircraftDoor` benchmark using a temporary one-benchmark LF directory.

Expected TR smoke result:

```text
analysis_result=satisfied
```

Expected LF smoke result:

```text
AircraftDoor,...,Valid,0,0,0,...
```

The LF smoke wrapper creates a temporary directory:

```text
LF/_smoke/
```

and copies only `AircraftDoor.lf` into it before running the LF benchmark script.

Generated smoke-test files are not committed.

## Timed Rebeca/RMC workflow

The TR-side workflow uses the **RMC command-line model checker**.

The Timed Rebeca benchmark material is stored under:

```text
TR/src/
```

Each benchmark subdirectory contains:

- one Timed Rebeca model file (`*.rebeca`),
- one property file (`*.property`).

The batch script is:

```text
TR/tools/batch_rmc.py
```

The script assumes:

- `java` is available on the system path,
- a C++ compiler is available on the system path as `c++`,
- `rmc-2.14.jar` has been downloaded into `TR/tools/`.

Run one TR benchmark:

```bash
cd verifier-benchmarks/TR
python3 tools/batch_rmc.py --only AircraftDoor
```

Run all TR benchmarks:

```bash
cd verifier-benchmarks/TR
python3 tools/batch_rmc.py
```

TR outputs are written under:

```text
TR/_cli_runs/
```

The CSV summary is written to:

```text
TR/_cli_runs/results.csv
```

The committed sample TR result summary is:

```text
TR/sample_results.csv
```

## Lingua Franca/Uclid/Z3 workflow

The LF-side workflow assumes local installation of:

- `lfc`
- `uclid`
- `z3`

Depending on your setup, `LF/env.bash` may also need to be sourced.

Run the LF smoke benchmark through the wrapper:

```bash
cd verifier-benchmarks
./scripts/run_lf_smoke.sh
```

Run all LF benchmarks:

```bash
cd verifier-benchmarks/LF
./scripts/run-benchmarks benchmarks
```

This executes the LF-side verification workflow over all benchmark files under:

```text
LF/benchmarks/src/
```

The LF workflow may generate or use:

- `.ucl` verification models,
- `.dot` state-space graphs,
- `.smt` files,
- `.json` counterexample traces,
- raw `.txt` logs,
- summarized `.csv` result tables.

Final benchmark logs and summaries are stored under:

```text
LF/results/
```

Temporary smoke-test files are written under:

```text
LF/_smoke/
```

These generated smoke-test files are not committed.

## Included sample results

This repository includes sample result summaries for both TR and LF.

The TR sample results are stored in:

```text
TR/sample_results.csv
```

The LF sample results are stored under:

```text
LF/results/
```

These sample results document the benchmark outcomes used in the evaluation and make the comparison setup easier to inspect without rerunning the full benchmark suite.

Generated run directories such as `TR/_cli_runs/` and `LF/_smoke/` are not committed to the repository.

## Result files and model-level verification table mapping

The model-level verification comparison in the paper is derived from the committed TR and LF result summaries.

The table is titled:

```text
Model-level verification outcome, timing, and verification size indicators comparison
```

Relevant files:

```text
TR/sample_results.csv
LF/results/result-*.csv
LF/results/result-*.txt
```

### Timed Rebeca/RMC columns

Source file:

```text
TR/sample_results.csv
```

| Paper column | CSV field |
|---|---|
| Benchmark | `model` |
| Res. | `analysis_result` |
| Gen. | `generation_seconds` |
| Cmp. | `compile_seconds` |
| Ver. | `verification_seconds` |
| St. | `reached_states` |
| Tr. | `reached_transitions` |

Result abbreviation:

- `satisfied` → `Sat.`
- counterexample / violated result → `C.E.`

### Lingua Franca/Uclid/Z3 columns

Source files:

```text
LF/results/result-*.csv
LF/results/result-*.txt
```

| Paper column | CSV field |
|---|---|
| Benchmark | `benchmark` |
| Res. | `lf_validity` |
| LFC | `lfc_real_sec` |
| Ucl. | `uclid_real_sec` |
| Z3 | `z3_real_sec` |
| `ct` | `ct` |

Result abbreviation:

- `Valid` with expected-valid benchmark → `Sat.`
- `Not valid` with expected-counterexample benchmark → `C.E.`
- resource-bound or failed workflow → `Fail`
- unknown or unsupported verifier outcome → `UK`

In the paper table:

- `CheckpointBarrier2` is reported as `Fail` on the LF side because the workflow reaches a resource-bound failure.
- `WideBarrier24` is reported as `UK` on the LF side because it has a very large communication bound (`ct = 1301`) and falls outside the supported downstream LF verification bound used in this evaluation.

To regenerate the TR/RMC result CSV:

```bash
cd verifier-benchmarks/TR
python3 tools/batch_rmc.py
```

This writes:

```text
TR/_cli_runs/results.csv
```

To regenerate the LF/Uclid/Z3 result CSV and raw log:

```bash
cd verifier-benchmarks/LF
./scripts/run-benchmarks benchmarks
```

This writes timestamped files under:

```text
LF/results/
```

Timing values are machine-dependent. The committed results correspond to the Ubuntu setup described above.

## Benchmark set

The benchmark set includes small and medium-sized examples with different verification characteristics.

Informal categories:

- **toy / arithmetic / minimal examples**  
  `Minimal`, `Factorial`, `Fibonacci`

- **message-passing and communication patterns**  
  `PingPong`, `Pipe`, `ProcessMsg`, `Ring`, `SafeSend`, `UnsafeSend`

- **distributed coordination / protocol-like behavior**  
  `Election`, `CheckpointBarrier2`, `WideBarrier24`

- **control and cyber-physical scenarios**  
  `AircraftDoor`, `Alarm`, `Subway`, `Thermostat`, `TrafficLight`, `TrainDoor`, `TrainDoor2`, `TrainDoorFeedback`

The authoritative artifacts are the actual TR and LF models included in the repository.

Two demanding LF-side cases deserve special mention:

- **WideBarrier24** produces a very large communication bound (`ct = 1301`) and falls outside the supported downstream LF verification bound (`ct < 100`).
- **CheckpointBarrier2** reaches `ct = 61` and exceeded the memory limits of the documented machine configuration during verification.

Both benchmarks still run successfully on the TR side using RMC.

## Interpreting LF failures

Some LF rows in the included results are resource-bound workflow failures rather than semantic verification outcomes.

- **CheckpointBarrier2** is marked `Not valid` with `lfc_exit_code = 1`. In this setup, the downstream Uclid SMT-generation step is killed with exit code 137.
- **WideBarrier24** is marked `UNKNOWN` with `ct = 1301`, with no successful downstream Uclid/Z3 verification stage.

When comparing LF and TR results, distinguish between:

- semantic/property outcomes, such as satisfied properties or counterexamples,
- resource-bound workflow failures, such as cases that exceed the hardware limits of the documented machine.

## Scope

This benchmark directory is not the core translator implementation.

It is an evaluation harness used to compare verification behavior across equivalent TR and LF benchmark models. It should be read as a companion artifact to the main ReLico tool.

The comparison does **not** cover unrestricted LTL properties across both frameworks. LF properties written using `@property` are translated into bounded model-checking queries over a Uclid model, while the RMC-based TR workflow used here checks equivalent observer-based state assertions.

## Provenance and attribution

The LF-side benchmark workflow in this directory is adapted from:

- **LF Verifier Benchmarks**  
  `https://github.com/lf-lang/lf-verifier-benchmarks`

That benchmark suite accompanies:

- **Towards Building Verifiable CPS using Lingua Franca**  
  ACM Transactions on Embedded Computing Systems, 2023  
  DOI: `10.1145/3609134`  
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

In this repository, that benchmark infrastructure has been adapted to support comparison against Timed Rebeca verification artifacts for equivalent models.

If you use this benchmark material, please cite:

1. the ReLico paper and artifact release, and
2. the prior LF verification benchmark work from which the LF-side workflow was adapted.
