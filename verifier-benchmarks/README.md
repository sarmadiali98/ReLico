# Verification Benchmarks: Lingua Franca vs Timed Rebeca

This directory contains the verification-oriented benchmark material used in the ReLico evaluation.

Its purpose is to support a **comparison between equivalent Timed Rebeca (TR) and Lingua Franca (LF) models** with respect to:

- verification capability,
- resource requirements,
- time consumed during verification.

In other words, this benchmark set is used to study how equivalent models behave when verified in the two ecosystems. It is an evaluation harness, not the core ReLico translator itself.

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

The helper scripts are:

```text
verifier-benchmarks/scripts/check_env.sh
verifier-benchmarks/scripts/run_tr_smoke.sh
verifier-benchmarks/scripts/run_lf_smoke.sh
verifier-benchmarks/scripts/run_smoke.sh
```

These scripts are intended to avoid requiring reviewers to manually reconstruct the benchmark commands.

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

You can verify that it is in place with:

```bash
ls -lh verifier-benchmarks/TR/tools/rmc-2.14.jar
```

or, from inside `verifier-benchmarks/`:

```bash
ls -lh TR/tools/rmc-2.14.jar
```

The RMC jar used in our Ubuntu test had the following SHA256 checksum:

```text
a39112046d99e0895cf47f890242ace21db896e609f7eef86751a0d416d477f5
```

To verify the checksum on Linux:

```bash
sha256sum verifier-benchmarks/TR/tools/rmc-2.14.jar
```

To verify the checksum on macOS:

```bash
shasum -a 256 verifier-benchmarks/TR/tools/rmc-2.14.jar
```

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

The helper script checks the required command-line tools:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

If a tool is missing, install it or place it on your `PATH` before running the verifier workflows.

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

## Known-good environment

The included results and smoke-test validation were produced on the following Ubuntu setup:

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

The TR and LF timing/resource numbers should be interpreted as being gathered under the same hardware conditions.

If you reproduce the benchmark workflow on a different machine or operating system, timing and resource measurements may differ.

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

The smoke test is intentionally small. It is meant to confirm that the verifier toolchain is configured correctly before launching the full benchmark reruns.

## Goal

The benchmark workflow in this directory was assembled to answer the following practical question:

> Given equivalent TR and LF models, how do the two verification workflows compare in what they can verify, how much time they consume, and what computational cost they incur?

The comparison is centered on:

- what properties can be checked successfully,
- the verification outcome,
- the time and resource cost of verification,
- the practical limits encountered by each verification workflow.

## Directory structure

This benchmark material is split into two parts:

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

### `TR/`

This directory contains the **Timed Rebeca benchmark workflow**.

The Timed Rebeca benchmarks are organized as follows:

- `TR/src/` contains one subdirectory per benchmark model.
- Each benchmark directory contains the Timed Rebeca model file (`*.rebeca`) and its corresponding property file (`*.property`).
- `TR/tools/` contains the command-line verification script:
  - `batch_rmc.py`.

When the Timed Rebeca benchmark script is run, it generates a `_cli_runs/` directory inside `TR/` containing generated C++ files, compiled executables, XML result files, logs, and a CSV summary.

### `LF/`

This directory contains the **Lingua Franca benchmark workflow**.

It includes:

- LF benchmark programs,
- helper scripts,
- environment configuration,
- generated benchmark results.

The main LF benchmark runner is:

```text
LF/scripts/run-benchmarks
```

## Smoke-test workflow

The recommended first benchmark check is:

```bash
cd verifier-benchmarks
./scripts/run_smoke.sh
```

This script performs three steps:

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

## Timed Rebeca side

The **TR-side** results are obtained using the **RMC command-line model checker**.

The Timed Rebeca benchmark material is stored under:

```text
TR/src/
```

Each benchmark subdirectory contains:

- one Timed Rebeca model file (`*.rebeca`),
- one property file (`*.property`).

The CLI workflow is implemented in:

```text
TR/tools/batch_rmc.py
```

The script assumes:

- `java` is available on the system path,
- a C++ compiler is available on the system path as `c++`,
- `rmc-2.14.jar` has been downloaded into `TR/tools/`.

### Running one TR benchmark

From inside `verifier-benchmarks/TR/`, run:

```bash
python3 tools/batch_rmc.py --only AircraftDoor
```

### Running all TR benchmarks

From inside `verifier-benchmarks/TR/`, run:

```bash
python3 tools/batch_rmc.py
```

### TR outputs

The Timed Rebeca workflow generates:

- generated C++ verification code,
- compiled executables,
- `result.xml` model-checking reports,
- `statespace.xml` exported state-space files,
- raw stdout/stderr logs for generation, compilation, and verification,
- summarized `.csv` results.

These outputs are stored under:

```text
TR/_cli_runs/
```

The CSV summary is written to:

```text
TR/_cli_runs/results.csv
```

The repository includes a sample TR result summary at:

```text
TR/sample_results.csv
```

## Lingua Franca side

The **LF-side** workflow is automated and can be run from the `LF/` directory.

The LF benchmark workflow assumes local installation of:

- `lfc`
- `uclid`
- `z3`

Depending on your setup, `LF/env.bash` may also need to be sourced.

### Running one LF smoke benchmark

The recommended single-benchmark LF smoke test is the top-level wrapper:

```bash
cd verifier-benchmarks
./scripts/run_lf_smoke.sh
```

This creates a temporary directory:

```text
LF/_smoke/
```

and copies only `AircraftDoor.lf` into it before running the LF benchmark script.

### Running all LF benchmarks

From inside `verifier-benchmarks/LF/`, run:

```bash
./scripts/run-benchmarks benchmarks
```

This executes the LF-side verification workflow over all benchmark files under:

```text
LF/benchmarks/src/
```

### LF outputs

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

The smoke-test wrapper also creates temporary files under:

```text
LF/_smoke/
```

These generated smoke-test files are not committed.

## Included sample results

This repository includes **sample result summaries for both TR and LF**.

The **TR** sample results are stored in:

```text
TR/sample_results.csv
```

The **LF** sample results are stored under:

```text
LF/results/
```

These sample results document the benchmark outcomes used in the evaluation and make the comparison setup easier to inspect and reproduce.

Generated run directories such as `TR/_cli_runs/` and LF temporary smoke-test directories are not committed to the repository.

## Result files and paper-related tables

The verification comparison in Table V of the paper is derived from the committed TR and LF result summaries.

Table V is titled:

```text
Model-level verification outcome, timing, and verification size indicators comparison
```

The relevant result files are:

```text
TR/sample_results.csv
LF/results/result-*.csv
LF/results/result-*.txt
```

### Timed Rebeca/RMC side

Source file:

```text
TR/sample_results.csv
```

Column mapping:

| Paper column | CSV field |
|---|---|
| Benchmark | `model` |
| Res. | `analysis_result` |
| Gen. | `generation_seconds` |
| Comp. | `compile_seconds` |
| Ver. | `verification_seconds` |
| States | `reached_states` |
| Trans. | `reached_transitions` |

Result abbreviation:

- `satisfied` → `Sat.`
- counterexample / violated result → `C.EX`

### Lingua Franca/Uclid/Z3 side

Source files:

```text
LF/results/result-*.csv
LF/results/result-*.txt
```

Column mapping:

| Paper column | CSV field |
|---|---|
| Benchmark | `benchmark` |
| Res. | `lf_validity` |
| `ct` | `ct` |
| LFC | `lfc_real_sec` |
| Uclid | `uclid_real_sec` |
| Z3 | `z3_real_sec` |

Result abbreviation:

- `Valid` with expected-valid benchmark → `Sat.`
- `Not valid` with expected-counterexample benchmark → `C.EX`
- resource-bound or failed workflow → `Fail`
- unknown or unsupported verifier outcome → `UNK`

In the paper table:

- `CheckpointBarrier2` is reported as `Fail` on the LF side because the workflow reaches a resource-bound failure.
- `WideBarrier24` is reported as `UNK` on the LF side because it has a very large communication bound (`ct = 1301`) and falls outside the practical LF verification range used in this evaluation.

### Regenerating the table inputs

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

The timing values are machine-dependent. The committed results correspond to the Ubuntu setup described above.

## Provenance and adaptation

The LF-side benchmark workflow in this directory is **adapted from** the public repository:

- **LF Verifier Benchmarks**  
  `https://github.com/lf-lang/lf-verifier-benchmarks`

That benchmark suite accompanies the paper:

- **Towards Building Verifiable CPS using Lingua Franca**  
  ACM Transactions on Embedded Computing Systems, 2023  
  DOI: `10.1145/3609134`  
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

In the present repository, that benchmark infrastructure has been adapted to support comparison against **Timed Rebeca verification artifacts** for equivalent models.

## What is being compared

For each benchmark pair, the intended comparison is between:

- a **Timed Rebeca model** in `TR/`,
- an **equivalent Lingua Franca model** in `LF/`.

The comparison focuses on verification-related measures such as:

- whether the property could be checked successfully,
- the verification outcome,
- the time needed for verification,
- generated artifact complexity,
- and the practical resource burden of the verification process.

## Property coverage and comparison scope

This comparison is restricted to the subset of verification tasks that could be executed in both toolchains under the configuration used in this repository.

In particular, **LTL-property comparisons are not included**. While LTL verification was available in the LF-side workflow, we were not able to evaluate corresponding LTL properties on the RMC-based TR-side workflow used here. Therefore, the comparison reported in this benchmark suite should not be interpreted as covering LTL verification capabilities across the two frameworks.

## Benchmark set

The included benchmark set covers a mix of small and medium-sized examples with different verification characteristics.

Broadly, the benchmark names correspond to several informal categories:

- **toy / arithmetic / minimal examples**  
  `Minimal`, `Factorial`, `Fibonacci`

- **message-passing and communication patterns**  
  `PingPong`, `Pipe`, `ProcessMsg`, `Ring`, `SafeSend`, `UnsafeSend`

- **distributed coordination / protocol-like behavior**  
  `Election`, `CheckpointBarrier2`, `WideBarrier24`

- **control and cyber-physical scenarios**  
  `AircraftDoor`, `Alarm`, `Subway`, `Thermostat`, `TrafficLight`, `TrainDoor`, `TrainDoor2`, `TrainDoorFeedback`

These labels are only intended as a high-level guide to the benchmark mix; the authoritative artifacts are the actual TR and LF models included in the repository.

Two of the more demanding benchmarks deserve special mention:

- **WideBarrier24** produces a very large communication bound (`ct = 1301`) on the LF side and falls outside the practical LF verification criteria (`ct < 100`).
- **CheckpointBarrier2** reaches `ct = 61` on the LF side and exceeded the memory limits of the included machine configuration during verification.

Both of these benchmarks still run successfully on the TR side using RMC.

## Interpreting LF failures and `lfc_exit_code`

Demanding LF benchmarks in the included sample results:

- **CheckpointBarrier2** is marked **Not valid** with `lfc_exit_code = 1`. This is a resource-bound LF workflow failure in the included setup. The LF run reports a failed/mismatched verification outcome and does not produce usable downstream SMT artifacts. The later Uclid SMT-generation step is killed with exit code 137.
- **WideBarrier24** is marked **UNKNOWN** and has `ct = 1301`, with no successful downstream Uclid/Z3 verification stage in the included results. In practice, this benchmark is outside the verifiable LF range.
- Both **CheckpointBarrier2** and **WideBarrier24** still produced valid TR-side results with RMC.

Accordingly, when comparing LF and TR results, LF rows that exceed the hardware limits of the documented machine should be interpreted as **resource-bound workflow failures**, not as meaningful semantic verification outcomes.

## Recommended comparison method

A typical comparison workflow is:

1. choose a benchmark pair,
2. verify the Timed Rebeca version from `TR/` using the CLI RMC workflow,
3. verify the corresponding Lingua Franca version from `LF/`,
4. compare:
   - success or failure,
   - property outcome,
   - verification time,
   - generated artifact complexity,
   - and observed resource demand.

When interpreting failures, distinguish between:

- **semantic / property failures**, such as assertion violations or queue overflow,
- and **resource-bound workflow failures**, such as LF cases that exceed the hardware limits of the documented machine.

These are not the same kind of outcome and should not be conflated in the evaluation.

## Scope

This benchmark directory is **not** the core translator implementation.

It is an **evaluation harness** used to compare verification behavior across equivalent TR and LF benchmark models.

It should therefore be read as a companion artifact to the main ReLico tool, rather than as the translator itself.

## Notes

- The LF-side workflow is based on previously published LF verification benchmark infrastructure and was adapted for this work.
- The purpose of the adaptation is comparative evaluation, not republication of the original LF benchmark suite in isolation.
- The TR-side workflow is repository-local and reproducible via the Python batch script plus an externally downloaded RMC jar.
- The TR and LF sides should be interpreted together as paired verification artifacts for cross-framework comparison.
- The included sample results should be understood as machine-specific benchmark measurements collected under the hardware configuration documented above.
- The top-level smoke-test scripts are the recommended first check before attempting a full rerun.

## Citation and attribution

If you use this benchmark material, please cite:

1. the ReLico paper and artifact release, and
2. the prior LF verification benchmark work from which the LF-side workflow was adapted.

### Adapted benchmark source

- **LF Verifier Benchmarks**  
  `https://github.com/lf-lang/lf-verifier-benchmarks`

### Associated prior paper

- **Towards Building Verifiable CPS using Lingua Franca**  
  ACM Transactions on Embedded Computing Systems, 2023  
  DOI: `10.1145/3609134`  
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

## Summary

This directory exists to support a **side-by-side verification comparison between Timed Rebeca and Lingua Franca models**.

The main question it supports is not just whether translation is possible, but also:

- how verification behaves on both sides,
- what each toolchain can establish,
- and what time and computational cost are incurred in doing so.
