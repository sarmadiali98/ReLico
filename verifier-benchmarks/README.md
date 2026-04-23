# Verification Benchmarks: Lingua Franca vs Timed Rebeca

This directory contains the verification-oriented benchmark material used in the ReLico evaluation.

Its purpose is to support a **comparison between equivalent Timed Rebeca (TR) and Lingua Franca (LF) models** with respect to:

- **verification capability**,
- **resource requirements**, and
- **time consumed during verification**.

In other words, this benchmark set is used to study how equivalent models behave when verified in the two ecosystems, rather than to demonstrate the core translation alone.

## Goal

The benchmark workflow in this directory was assembled to answer the following practical question:

> Given equivalent TR and LF models, how do the two verification workflows compare in what they can verify, how much time they consume, and what computational cost they incur?

The comparison is therefore centered on:

- what properties can be checked successfully
- the time and resource cost of verification.

## Directory structure

This benchmark material is split into two parts:

```text
verifier-benchmarks/
├── LF/
│   ├── benchmarks/
│   ├── env.bash
│   ├── results/
│   └── scripts/
└── TR/
    ├── src/
    │   ├── AircraftDoor/
    │   ├── Alarm/
    │   ├── Election/
    │   ├── Factorial/
    │   ├── Fibonacci/
    │   ├── Minimal/
    │   ├── PingPong/
    │   ├── Pipe/
    │   ├── ProcessMsg/
    │   ├── Ring/
    │   ├── RoadsideUnit/
    │   ├── SafeSend/
    │   ├── Subway/
    │   ├── Thermostat/
    │   ├── TrafficLight/
    │   ├── TrainDoor/
    │   ├── TrainDoor2/
    │   ├── TrainDoorFeedback/
    │   └── UnsafeSend/
    └── tools/
        └── batch_rmc.py
````

### `TR/`

This directory contains the **Timed Rebeca benchmark workflow**.

The Timed Rebeca benchmarks are organized as follows:

* `TR/src/` contains one subdirectory per benchmark model.
* Each benchmark directory contains the Timed Rebeca model file (`*.rebeca`) and its corresponding property file (`*.property`).
* `TR/tools/` contains the command-line verification script:

  * `batch_rmc.py`

The RMC jar is **not included in this repository** and must be downloaded separately before running the TR-side workflow.

When the Timed Rebeca benchmark script is run, it generates a `_cli_runs/` directory inside `TR/` containing generated C++ files, compiled executables, XML result files, logs, and a CSV summary.

### `LF/`

This directory contains the **Lingua Franca benchmark workflow**.

It includes:

* LF benchmark programs,
* helper scripts,
* environment configuration,
* generated benchmark results.

## Provenance and adaptation

The LF-side benchmark workflow in this directory is **adapted from** the public repository:

* **LF Verifier Benchmarks**
  `https://github.com/lf-lang/lf-verifier-benchmarks`

That benchmark suite accompanies the paper:

* **Towards Building Verifiable CPS using Lingua Franca**
  ACM Transactions on Embedded Computing Systems, 2023
  DOI: `10.1145/3609134`
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

In the present repository, that benchmark infrastructure has been **adapted for the purposes of this work**, specifically to support comparison against **Timed Rebeca verification artifacts** for equivalent models.

## What is being compared

For each benchmark pair, the intended comparison is between:

* a **Timed Rebeca model** in `TR/`
* an **equivalent Lingua Franca model** in `LF/`

The comparison focuses on verification-related measures such as:

* the size or shape of generated verification artifacts,
* the time needed for verification,
* and the practical resource burden of the verification process.

## Benchmark set

The included benchmark set covers a mix of small and medium-sized examples with different verification characteristics.

Broadly, the benchmark names correspond to several informal categories:

* **toy / arithmetic / minimal examples**
  `Minimal`, `Factorial`, `Fibonacci`
* **message-passing and communication patterns**
  `PingPong`, `Pipe`, `ProcessMsg`, `Ring`, `SafeSend`, `UnsafeSend`
* **distributed coordination / protocol-like behavior**
  `Election`
* **control and cyber-physical scenarios**
  `AircraftDoor`, `Alarm`, `RoadsideUnit`, `Subway`, `Thermostat`, `TrafficLight`, `TrainDoor`, `TrainDoor2`, `TrainDoorFeedback`

These labels are only intended as a high-level guide to the benchmark mix; the authoritative artifacts are the actual TR and LF models included in the repository.

## Verification toolchains

### Timed Rebeca side

The **TR-side** results are obtained using the **RMC command-line model checker**.

The Timed Rebeca benchmark material is stored under:

```text
TR/src/
```

Each benchmark subdirectory contains:

* one Timed Rebeca model file (`*.rebeca`)
* one property file (`*.property`)

The CLI workflow is implemented in:

```text
TR/tools/batch_rmc.py
```

The RMC jar is **not bundled in this repository**. It should be downloaded from the official releases page:

```text
https://github.com/rebeca-lang/org.rebecalang.rmc/releases
```

The CLI workflow performs the following steps for each benchmark:

1. generate C++ verification artifacts from the Timed Rebeca model,
2. compile the generated C++ files into an executable,
3. run the executable to perform model checking,
4. store the resulting XML reports, generated state-space export, logs, and CSV summary.

### Downloading the RMC jar

Download the jar into `TR/tools/`:

```bash
cd TR/tools
curl -L \
  -o TR/tools/rmc-2.14.jar \
  https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar
```

You can verify that it is in place with:

```bash
ls -l TR/tools/rmc-2.14.jar
```

### Running the TR benchmarks

From inside `TR/`, run:

```bash
python3 tools/batch_rmc.py
```

To run a single benchmark only:

```bash
python3 tools/batch_rmc.py --only AircraftDoor
```

The script assumes:

* `java` is available on the system path,
* a C++ compiler is available on the system path as `c++`,
* `rmc-2.14.jar` has been downloaded into `TR/tools/`.

### TR outputs

The Timed Rebeca workflow generates:

* generated C++ verification code,
* compiled executables,
* `result.xml` model-checking reports,
* `statespace.xml` exported state-space files,
* raw stdout/stderr logs for generation, compilation, and verification,
* summarized `.csv` results.

These outputs are stored under:

```text
TR/_cli_runs/
```

The CSV summary is written to:

```text
TR/_cli_runs/results.csv
```

### Lingua Franca side

The **LF-side** workflow is automated and can be run from the `LF/` directory.

The LF benchmark workflow assumes local installation of:

* `lfc`
* `uclid`
* `z3`

Depending on your setup, `LF/env.bash` may also need to be sourced.

## Running the LF benchmarks

From inside `LF/`, run:

```bash
cd LF
./scripts/run-benchmarks benchmarks
```

This executes the LF-side verification workflow over all benchmark files under:

```text
LF/benchmarks/src/
```

## LF outputs

The LF workflow may generate or use:

* `.ucl` verification models
* `.dot` state-space graphs
* `.smt` files
* `.json` counterexample traces
* raw `.txt` logs
* summarized `.csv` results

Final benchmark logs and summaries are stored under:

```text
LF/results/
```

## Included sample results

This repository includes **sample result summaries for both TR and LF**.

* The **TR** sample results are stored in:

  * `TR/sample_results.csv`
* The **LF** sample results are stored under:

  * `LF/results/`

These sample results are intended to document the benchmark outcomes used in the evaluation and to make the comparison setup easier to inspect and reproduce.

## Machine and environment used for the included results

The included **LF results** were produced on:

* **Operating system:** Ubuntu 25.10
* **Machine:** Lenovo IdeaPad 5
* **Memory:** 8 GB RAM
* **Processor:** Intel Core i5-1035G1

The included **TR sample results** were produced on the **same machine and configuration** as the LF sample results, so the provided TR/LF timing and resource numbers should be interpreted as being gathered under the same hardware conditions.

If you reproduce the benchmark workflow on a different machine or OS, timing and resource measurements may differ.

## Interpreting LF failures and `lfc_exit_code`

In the LF sample results, the `lfc_exit_code` field should be interpreted carefully.

In particular:

* `lfc_exit_code = 0` means the LF benchmark workflow completed normally at the `lfc` stage.
* `lfc_exit_code = 1` indicates that the LF verification workflow exceeded the practical hardware limits of the machine used for the sample results. In that case, the LF result should be treated as **not valid for comparison on that machine**.

This is especially relevant for the **RoadsideUnit** benchmark:

* on the LF side, the included sample results mark `RoadsideUnit` as **Not valid** with `lfc_exit_code = 1`
* on the TR side, the included sample results still contain a completed RMC result for `RoadsideUnit`

Accordingly, when comparing LF and TR results, an LF row with `lfc_exit_code = 1` should be interpreted as **out of hardware bounds on the reported machine**, not as a meaningful negative verification outcome.

## Recommended comparison method

A typical comparison workflow is:

1. choose a benchmark pair,
2. verify the Timed Rebeca version from `TR/` using the CLI RMC workflow,
3. verify the corresponding Lingua Franca version from `LF/`,
4. compare:

   * success or failure,
   * property outcome,
   * verification time,
   * generated artifact complexity,
   * and observed resource demand.

When interpreting failures, distinguish between:

* **semantic / property failures**, such as assertion violations or queue overflow,
* and **resource-bound workflow failures**, such as LF cases where `lfc_exit_code = 1`.

These are not the same kind of outcome and should not be conflated in the evaluation.

## Scope

This benchmark directory is **not** the core translator implementation.

It is an **evaluation harness** used to compare verification behavior across equivalent TR and LF benchmark models.

It should therefore be read as a companion artifact to the main ReLico tool, rather than as the translator itself.

## Notes

* The LF-side workflow is based on previously published LF verification benchmark infrastructure and was adapted for this work.
* The purpose of the adaptation is **comparative evaluation**, not republication of the original LF benchmark suite in isolation.
* The TR-side workflow is repository-local and reproducible via the Python batch script plus an externally downloaded RMC jar.
* The TR and LF sides should be interpreted together as paired verification artifacts for cross-framework comparison.
* The included sample results should be understood as **machine-specific benchmark measurements** collected under the hardware configuration documented above.

## Citation and attribution

If you use this benchmark material, please cite:

1. the ReLico paper and artifact release, and
2. the prior LF verification benchmark work from which the LF-side workflow was adapted.

### Adapted benchmark source

* **LF Verifier Benchmarks**
  `https://github.com/lf-lang/lf-verifier-benchmarks`

### Associated prior paper

* **Towards Building Verifiable CPS using Lingua Franca**
  ACM Transactions on Embedded Computing Systems, 2023
  DOI: `10.1145/3609134`
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

## Summary

This directory exists to support a **side-by-side verification comparison between Timed Rebeca and Lingua Franca models**.

The main question it supports is not just whether translation is possible, but also:

* how verification behaves on both sides,
* what each toolchain can establish,
* and what time and computational cost are incurred in doing so.
