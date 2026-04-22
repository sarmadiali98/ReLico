# ReLico: Timed Rebeca to Lingua Franca Compiler

ReLico is a compiler from **Timed Rebeca** to **Lingua Franca (LF)**.

This repository accompanies the ReLico work on bridging **formally verified Timed Rebeca models** to **executable Lingua Franca programs**. Its purpose is to reduce the gap between formal verification and deployment by automatically translating verified models into a deterministic, time-aware execution framework.

In addition to the core translator, this repository also contains:

- a **hardware-backed smart-home validation workflow**, and
- an **verification benchmark workflow for equivalent TR and LF codes** used to study and compare the Lingua Franca verifier toolchain with the Timed Rebeca verifier.

## Overview

Timed Rebeca is an actor-based language for modeling and verifying concurrent and real-time systems. Lingua Franca is a deterministic coordination language based on the reactor model. ReLico translates a deterministic subset of Timed Rebeca into Lingua Franca while preserving the timing and scheduling structure needed for execution and analysis.

In particular, ReLico:

- translates **Deterministic Timed Rebeca (DTR)** models into **Lingua Franca**
- maps actor/message-server structure to reactors, ports, actions, and reactions
- preserves local message-server priority using LF reaction declaration order
- translates timing behavior based on the `after(...)` construct
- generates LF code targeting the **C++ runtime**

## Relation to the paper

This repository is the implementation artifact for the ReLico paper.

The paper contributes:

1. a mapping from Timed Rebeca to Lingua Franca,
2. an implementation of the translation in the ReLico tool,
3. an operational argument for behavioral correspondence between the source and target semantics, and
4. evaluation across translation examples, verification-oriented benchmarks, and a hardware-backed smart-home example.

## Repository contents

Typical contents of this repository are:

- `src/main/java/`  
  Main compiler implementation.

- `src/main/java/org/rebecalang/compiler/RebecaCompilerMain.java`  
  Main entry point.

- `src/main/java/org/rebecalang/compiler/modelcompiler/linguafranca/`  
  Timed Rebeca → Lingua Franca translation logic.

- `benchmarks/`  
  Example Timed Rebeca input models and benchmarks.

- `examples/hardware/smarthome/`  
  Hardware-validation example, including:
  - Timed Rebeca source model,
  - property specification,
  - generated LF,
  - hardware-adapted LF,
  - Python serial bridge,
  - ESP32 firmware created with PlatformIO.

- `verifier-benchmarks/`  
  Verification-oriented evaluation material organized into:
  - `verifier-benchmarks/TR/` for Timed Rebeca benchmark models, and
  - `verifier-benchmarks/LF/` for Lingua Franca benchmark models, benchmark scripts, environment configuration, and recorded results.

If your local layout differs slightly, treat the above as the logical organization of the artifact.

## Supported subset

ReLico currently targets a **deterministic subset of Timed Rebeca** and a corresponding subset of Lingua Franca.

### Timed Rebeca assumptions

The supported source subset is **Deterministic Timed Rebeca (DTR)**:

- actor execution is deterministic
- scheduling conflicts are resolved by explicit `@priority(...)`
- the `after(...)` timing primitive is supported
- `delay` and `deadline` are not part of the supported subset

### Lingua Franca assumptions

The generated LF targets a subset centered on:

- reactors
- input and output ports
- state
- logical actions
- reactions
- main-reactor connections

The mapping does **not** rely on full LF features such as timers, physical actions, methods, or hierarchical models.

## Translation mapping

At a high level, ReLico maps the source and target languages as follows:

- `reactiveclass` → `reactor`
- `knownrebecs` → explicit port connections in `main reactor`
- constructor parameters → reactor parameters
- `statevars` → state declarations
- constructor body → `reaction(startup)`
- internal message servers (`self`) → logical actions + reactions
- external message servers → input ports + reactions
- `self.m() after(t)` → action scheduling
- `r.m() after(t)` → connection `after t`
- `@priority(n)` → reaction declaration order

## Important semantic notes and limitations

The current translation intentionally restricts some cases to preserve a clean and faithful mapping.

### Explicit connection delays

Generated LF connections should explicitly use a delay of `0` or greater. The subset used by ReLico avoids connections with omitted delay annotations because they complicate timing correspondence.

### Multiple senders

If multiple actors in Timed Rebeca target the same message server, LF’s single-writer port discipline requires the translation to generate dedicated input ports as needed.

### Simultaneous identical back-to-back messages

A known out-of-scope case is the transmission of identical simultaneous back-to-back messages from a single sender to the exact same target at the exact same logical time. This is excluded to avoid introducing extra manual queuing mechanisms in generated LF state.

## Requirements

- **Java Development Kit (JDK)**: version 17 or later
- **Maven**: for dependency resolution and building

Tested configurations:

- macOS Sequoia 15.1.1 with Java 21.0.1
- Ubuntu 24.04.1 with Java 21.0.5

Recommended minimum resources:

- 2 CPU cores
- 8 GB RAM
- 2 GB free disk space

## Installation

Clone the repository:

```bash
git clone <your-repository-url>
cd ReLico
````

Check Java and Maven:

```bash
java -version
mvn -version
```

Build the project:

```bash
mvn clean install
```

## Running the compiler

The compiler processes Timed Rebeca input models and generates corresponding Lingua Franca files.

### Input models

Place `.rebeca` input files in the repository’s benchmark/input-model location.

In the current codebase and examples, you may see input models in locations such as:

* `benchmarks/`
* `src/test/resources/org/rebecalang/compiler/modelcompiler/models/`

Use the location expected by your current project configuration.

### Run command

Run the main class with Maven:

```bash
mvn exec:java -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"
```

### Expected result

A successful run should:

* finish with `BUILD SUCCESS`
* process the discovered `.rebeca` input files
* generate corresponding `.lf` output files in the output directory

### Output location

Generated LF files are written to:

```text
compiledLF/
```

## Quick smoke test

A simple smoke test is:

1. ensure at least one sample `.rebeca` file is available,
2. run the compiler,
3. confirm that a corresponding `.lf` file appears in `compiledLF/`.

Example expectations:

* `pingpong.rebeca` produces a corresponding LF output
* sample node/switch/router or sender/receiver benchmarks are translated successfully
* the build ends with `BUILD SUCCESS`

## Hardware validation example

This repository also contains a **hardware-backed smart-home example** that demonstrates an end-to-end path from:

Timed Rebeca model → generated LF → adapted LF runtime → ESP32 sensor input → runtime property validation

This example is included to support the hardware-validation part of the paper. It is **not** required to use the core translator.

### Smart-home example contents

The smart-home example includes:

* a Timed Rebeca source model
* a property file
* a directly generated LF file
* a hardware-adapted LF file
* a Python serial bridge
* ESP32 firmware
* PlatformIO project configuration

### Hardware/software stack

The example uses:

* **ESP32-WROOM-32 / esp32dev-style setup**
* **DHT22** on GPIO 27
* **LDR/light sensor** on GPIO 34
* **PIR motion detector** on GPIO 35
* **PlatformIO** with the **Arduino** framework
* serial output at **115200 baud**
* a Python bridge that stores the latest sensor readings in `sensor_data.jsonl`

### Important distinction

Two LF files may be present in the smart-home example:

* a **generated LF file** produced directly by ReLico
* a **hardware-adapted LF file** used for the live sensor experiment

The hardware-backed execution path uses the adapted LF version, which includes the extra integration needed to consume runtime sensor data. This should not be confused with the raw translator output.

### PlatformIO note

The ESP32 firmware for the smart-home example was created and used with **PlatformIO**. If you want to reproduce that path, see the README inside the smart-home example directory.

## Expected smart-home behavior

The smart-home example is designed around five validated properties:

* `FireKeepsDoorOpen`
* `FireOverridesIntrusion`
* `HeaterOffDuringFire`
* `EmergencyImpliesAlarmOrHistory`
* `LightOffDuringIntrusionOverride`

The evaluation scenarios include:

1. fire emergency
2. intrusion with stealth mode
3. fire overriding intrusion
4. normal baseline operation
5. cold-temperature heater activation

These scenarios are validated through runtime event and property markers in the adapted LF execution path.

## LF verification benchmark workflow

This repository also contains an **LF verification benchmark workflow** that supports the verification-oriented evaluation in the paper.

This part of the artifact is included to document how selected Timed Rebeca benchmarks were translated to Lingua Franca and then checked using the LF verifier toolchain. It is **not** required to use the core Timed Rebeca → Lingua Franca translator.

### Verification benchmark contents

The verification benchmark material is organized into two parts:

* `verifier-benchmarks/TR/`
  Timed Rebeca benchmark models.

* `verifier-benchmarks/LF/`
  Lingua Franca benchmark models and the supporting verification workflow, including:

  * generated or adapted LF benchmark programs,
  * benchmark-running scripts,
  * environment configuration,
  * raw result logs,
  * CSV summaries of the final benchmark run.

### Provenance note

The LF-side benchmark workflow in this repository is **adapted** from the public **LF Verifier Benchmarks** repository maintained by the Lingua Franca project:

* Repository: `https://github.com/lf-lang/lf-verifier-benchmarks`
* Associated paper: `https://dl.acm.org/doi/full/10.1145/3609134`

That benchmark suite was developed for prior work on Lingua Franca property verification. In this repository, the benchmark infrastructure is reused and adapted for the purposes of the present work.

### Verification toolchain

The verification benchmark workflow assumes a local installation of:

* **Lingua Franca (`lfc`)**
* **Uclid5**
* **Z3**

The benchmark script runs the LF verifier pipeline on the benchmark set and records generated verification artifacts and timing summaries.

### Important distinction

This benchmark workflow should be distinguished from both:

* the **core translation workflow**, whose purpose is to generate LF from Timed Rebeca, and
* the **hardware-backed smart-home workflow**, whose purpose is runtime validation on physical hardware.

The verification benchmark workflow is specifically for **offline property-checking experiments** on LF models.

### Expected benchmark artifacts

Depending on the benchmark and the verifier outcome, the LF verification workflow may generate:

* `.ucl` verification models
* `.dot` state-space or model graphs
* `.smt` formulas produced from Uclid5
* `.json` counterexample traces for violated properties
* raw `.txt` timing/result logs
* summarized `.csv` result tables

### Reproducing the verification benchmark run

From the LF benchmark directory, run:

```bash
cd verifier-benchmarks/LF
./scripts/run-benchmarks benchmarks
```

A successful run should produce benchmark logs and a CSV summary under:

```text
verifier-benchmarks/LF/results/
```

### Recommended use in this repository

If you are evaluating the translation itself, the main compiler workflow is sufficient.

If you want to inspect the verification-oriented evaluation used in the paper, use the LF verification benchmark workflow and the accompanying result files.

## Reproducing paper-related results

This repository supports three different levels of use:

### 1. Core translation workflow

Use the translator on example or benchmark Timed Rebeca inputs and inspect the generated LF outputs.

### 2. End-to-end smart-home workflow

Use the smart-home directory to reproduce the hardware-backed example with:

* ESP32 firmware
* PlatformIO upload/monitor
* Python serial bridge
* hardware-adapted LF program

### 3. LF verification benchmark workflow

Use the verification benchmark directory to reproduce the LF-side verification experiments and inspect the generated logs, timing summaries, and derived benchmark data.

If you only want to evaluate the translator itself, the first workflow is sufficient.

## Common issues

### Maven not installed

Install Maven with your package manager:

```bash
brew install maven
```

or:

```bash
sudo apt install maven
```

### Dependency resolution issues

Try:

```bash
mvn dependency:resolve
```

### Java version mismatch

Make sure `java -version` reports JDK 17 or newer.

### No output files generated

Check that:

* input `.rebeca` files are placed in the expected input directory
* the project builds successfully
* the compiler is using the directory layout you expect

### Smart-home serial bridge does not connect

If you are using the hardware example, edit the serial port in `serial_bridge.py` to match your system.

### LF benchmark script cannot find tools

If you are using the verification benchmark workflow, make sure `lfc`, `uclid`, and `z3` are installed and available on your `PATH`, and confirm that the benchmark-side `env.bash` is sourced if your setup depends on it.

## License

ReLico is distributed under the **GNU GPL v2.0**; see `LICENSE`.

This repository includes or adapts work built on the Rebeca compiler framework and should retain the associated license and provenance notices.

Unless explicitly stated otherwise, the example files in this repository are distributed under the same license as the main project.

## Third-party software and dependencies

This repository may rely on third-party software and libraries that remain under their own licenses.

Examples include:

* Maven dependencies used by the Java compiler project
* PlatformIO
* Arduino framework for ESP32
* Adafruit DHT Sensor Library
* Adafruit Unified Sensor
* Lingua Franca
* Uclid5
* Z3

These dependencies are not relicensed by this repository.

## Citation

If you use ReLico in academic work, please cite:

1. the associated ReLico paper and archived artifact release, and
2. the prior LF verification benchmark infrastructure when using or discussing the adapted verification benchmark workflow in this repository.

The LF-side verification benchmark workflow included here is adapted from:

* **LF Verifier Benchmarks**
  `https://github.com/lf-lang/lf-verifier-benchmarks`

The adapted benchmark workflow is associated with the prior paper:

* **Towards Building Verifiable CPS using Lingua Franca**
  ACM Transactions on Embedded Computing Systems, 2023
  DOI: `10.1145/3609134`
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

If you use the verification benchmark portion of this repository, cite that paper in addition to the present work.

## Notes for artifact evaluation

For artifact-review purposes, the most important distinctions are:

* the core contribution is the Timed Rebeca → Lingua Franca translator
* the supported source language is a deterministic subset of Timed Rebeca
* the smart-home example is an end-to-end validation workflow
* the hardware-backed LF program contains additional integration beyond the raw generated LF file
* the verification benchmark workflow is a separate evaluation harness adapted from prior LF-verification-benchmark infrastructure and should be treated as such in reproduction and citation contexts

```
