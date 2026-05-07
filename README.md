# ReLico: Timed Rebeca to Lingua Franca Compiler

ReLico is a compiler from **Timed Rebeca** to **Lingua Franca (LF)**.

This repository accompanies the ReLico work on bridging **formally verified Timed Rebeca models** to **executable Lingua Franca programs**. Its purpose is to reduce the gap between formal verification and deployment by automatically translating verified models into a deterministic, time-aware execution framework.

In addition to the core translator, this repository also contains:

- a **hardware-backed smart-home validation workflow**, and
- a **verification benchmark workflow for equivalent TR and LF models** used to study and compare the Lingua Franca verifier toolchain with the Timed Rebeca verifier.

## Artifact overview

This repository contains the artifact for the ReLico paper. ReLico translates deterministic Timed Rebeca models to Lingua Franca programs.

The artifact has three main parts:

1. **Core translator**
   - Java/Maven implementation of the Timed Rebeca to Lingua Franca translator.
   - Source code is under `src/`.
   - Example input models are under `benchmarks/`.
   - The Docker quickstart runs this part of the artifact.

2. **Verification benchmark workflows**
   - Timed Rebeca/RMC benchmarks are under `verifier-benchmarks/TR/`.
   - Lingua Franca/Uclid/Z3 benchmarks are under `verifier-benchmarks/LF/`.
   - Helper scripts under `verifier-benchmarks/scripts/` check the environment and run a representative smoke test.
   - These workflows reproduce the model-level verification comparison reported in the paper.

3. **Smart-home hardware/replay example**
   - Located under `examples/hardware/smarthome/`.
   - Contains the Timed Rebeca model, generated LF code, hardware-adapted LF code, ESP32 firmware, serial bridge, replay script, sample data, and scenario logs.
   - Live hardware reproduction is optional. The included replay script and logs allow reviewers to inspect the reported behavior without physical hardware.

## Recommended reviewer paths

The artifact can be evaluated at several levels.

The recommended first path is the **Docker core-translator smoke test**, because it does not require Java or Maven to be installed manually on the host system.

### Path 1: Docker core-translator smoke test

This is the easiest first check. It builds the ReLico translator inside a container and runs it on the benchmark `.rebeca` models.

From the repository root:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

Expected result:

- the Java/Maven build succeeds,
- the ReLico compiler processes the `.rebeca` files under `benchmarks/`,
- generated `.lf` files appear under `compiledLF/` or `CompiledLF/`,
- the script prints a final success message such as `SUCCESS: generated ... LF files.`

After the image has been built, the smoke test can also be run without network access:

```bash
docker run --rm --network none relico-artifact
```

The Docker image is intentionally limited to the **core translator smoke test**. It does not include the optional verifier toolchains (`RMC`, `lfc`, `Uclid5`, `Z3`) or the optional ESP32/PlatformIO live-hardware workflow.

### Path 2: Native core translator smoke test

This path runs the core translator directly on the host machine. It requires Java and Maven.

```bash
mvn clean package -DskipTests
mvn org.codehaus.mojo:exec-maven-plugin:3.1.0:java \
  -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"
find compiledLF CompiledLF -maxdepth 2 -name "*.lf" 2>/dev/null
```

Expected result:

- the Java/Maven build succeeds,
- the ReLico compiler processes the `.rebeca` files under `benchmarks/`,
- generated `.lf` files appear under `compiledLF/` or `CompiledLF/`.

### Path 3: Verifier benchmark smoke test

This checks one representative benchmark through both verifier workflows:

- `AircraftDoor` through the Timed Rebeca/RMC workflow, and
- `AircraftDoor.lf` through the Lingua Franca/Uclid/Z3 workflow.

The RMC jar is not included in this repository because it is an external tool. Before running this path, download `rmc-2.14.jar` and place it at:

```text
verifier-benchmarks/TR/tools/rmc-2.14.jar
```

From the repository root, one way to download it is:

```bash
mkdir -p verifier-benchmarks/TR/tools

curl -L \
  -o verifier-benchmarks/TR/tools/rmc-2.14.jar \
  https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar
```

Then run:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
./scripts/run_smoke.sh
```

Expected result:

- the TR/RMC CSV reports `analysis_result=satisfied`, and
- the LF/Uclid/Z3 CSV reports `AircraftDoor,...,Valid,0,0,0,...`.

### Path 4: Smart-home replay

This checks the hardware case study without requiring physical ESP32 hardware.

Run:

```bash
cd examples/hardware/smarthome
lfc smarthome.lf
./run_scenario.sh scenario-3-fire-overrides-intrusion 38.0 40.0 1 1 10
```

Expected result: the log contains `[EVENT]`, `[INFO]`, and `[PROPERTY]` markers, including fire-overriding-intrusion behavior.

The live ESP32 workflow is optional because replay logs and replay scripts are included.

## Expected runtimes

These times are approximate and machine-dependent.

| Task | Command | Expected time |
|---|---|---:|
| Docker image build | `docker build -t relico-artifact .` | several minutes, depending on network and Docker cache |
| Docker core translator smoke test | `docker run --rm relico-artifact` | about 1-3 minutes after image build |
| Native core translator smoke test | Maven build + compiler run | about 1-3 minutes |
| Verifier smoke test | `cd verifier-benchmarks && ./scripts/run_smoke.sh` | about 1 minute on the tested Ubuntu machine |
| Smart-home replay, one scenario | `./run_scenario.sh ...` | 6-10 seconds plus LF compilation |
| Smart-home replay, all scenarios | five `run_scenario.sh` commands | about 1 minute plus LF compilation |
| Full LF verifier benchmark rerun | `cd verifier-benchmarks/LF && ./scripts/run-benchmarks benchmarks` | several minutes; demanding cases may hit resource limits |
| Full TR/RMC benchmark rerun | `cd verifier-benchmarks/TR && python3 tools/batch_rmc.py` | several minutes, machine-dependent |

## Overview

Timed Rebeca is an actor-based language for modeling and verifying concurrent and real-time systems. Lingua Franca is a deterministic coordination language based on the reactor model. ReLico translates a deterministic subset of Timed Rebeca into Lingua Franca while preserving the timing and scheduling structure needed for execution and analysis.

In particular, ReLico:

- translates **Deterministic Timed Rebeca (DTR)** models into **Lingua Franca**,
- maps actor/message-server structure to reactors, ports, actions, and reactions,
- preserves local message-server priority using LF reaction declaration order,
- translates timing behavior based on the `after(...)` construct,
- generates LF code targeting the **C++ runtime**.

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
  - ESP32 firmware created with PlatformIO,
  - hardware-free replay script,
  - recorded scenario logs.

- `verifier-benchmarks/`  
  Verification-oriented evaluation material organized into:
  - `verifier-benchmarks/TR/` for Timed Rebeca benchmark models,
  - `verifier-benchmarks/LF/` for Lingua Franca benchmark models,
  - `verifier-benchmarks/scripts/` for verifier smoke-test helper scripts.

- `Dockerfile`  
  Container setup for the core translator smoke test.

- `scripts/docker_smoke_test.sh`  
  Docker entrypoint script that builds the translator, runs the compiler on benchmark models, and checks that LF files were generated.

If your local layout differs slightly, treat the above as the logical organization of the artifact.

## Supported subset

ReLico currently targets a **deterministic subset of Timed Rebeca** and a corresponding subset of Lingua Franca.

### Timed Rebeca assumptions

The supported source subset is **Deterministic Timed Rebeca (DTR)**:

- actor execution is deterministic,
- scheduling conflicts are resolved by explicit `@priority(...)`,
- the `after(...)` timing primitive is supported,
- `delay` and `deadline` are not part of the supported subset.

### Lingua Franca assumptions

The generated LF targets a subset centered on:

- reactors,
- input and output ports,
- state,
- logical actions,
- reactions,
- main-reactor connections.

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
- `@priority(n)` → reaction declaration order or generated reaction order where applicable

## Important semantic notes and limitations

The current translation intentionally restricts some cases to preserve a clean and faithful mapping.

### Explicit connection delays

Generated LF connections should explicitly use a delay of `0` or greater. The subset used by ReLico avoids connections with omitted delay annotations because they complicate timing correspondence.

### Multiple senders

If multiple actors in Timed Rebeca target the same message server, LF’s single-writer port discipline requires the translation to generate dedicated input ports as needed.

### Simultaneous identical back-to-back messages

A known out-of-scope case is the transmission of identical simultaneous back-to-back messages from a single sender to the exact same target at the exact same logical time. This is excluded to avoid introducing extra manual queuing mechanisms in generated LF state.

## Requirements

The artifact is organized so that reviewers do **not** need to install every tool for every path.

### Minimal core translator requirements

For the Docker core translator workflow:

- Docker or a Docker-compatible container runtime.

For the native core translator workflow:

- **Java Development Kit (JDK)**: version 17 or later.
- **Maven**: for dependency resolution and building.

### Additional requirements for verifier benchmark reruns

The verifier benchmark smoke/full rerun requires:

- Python 3
- Java and Javac
- a C++ compiler available as `c++`
- RMC 2.14
- Lingua Franca compiler (`lfc`)
- Uclid5
- Z3

The helper script checks these requirements:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

### Additional requirements for smart-home replay

The hardware-free smart-home replay requires:

- Lingua Franca compiler (`lfc`)
- C++ compiler supported by the LF C++ target

### Additional requirements for optional live ESP32 workflow

The live ESP32 hardware workflow is optional and requires:

- ESP32 development board
- PlatformIO
- Arduino framework for ESP32
- Adafruit DHT Sensor Library
- Adafruit Unified Sensor
- Python 3 and `pyserial`

## Tested configurations

### macOS

- macOS on Apple Silicon
- Java 21.0.1
- Maven 3.9.9
- Lingua Franca compiler (`lfc`) 0.11.0
- Docker-compatible runtime tested through Colima/Docker CLI for the core Docker path
- Used for:
  - core translator build/smoke test,
  - Docker core translator smoke test,
  - smart-home replay,
  - live ESP32 hardware workflow.

### Ubuntu

- Ubuntu 24.04.4 LTS
- Lenovo IdeaPad 5
- Intel Core i3-1115G4
- 8 GB RAM
- Java/Javac 17.0.18
- Python 3.12.3
- Maven 3.9.9
- Lingua Franca compiler (`lfc`) 0.11.1-SNAPSHOT
- Uclid 0.9.5
- Z3 4.8.8
- RMC 2.14
- Used for:
  - core translator build/smoke test,
  - Timed Rebeca/RMC verifier smoke test,
  - Lingua Franca/Uclid/Z3 verifier smoke test.

Recommended minimum resources:

- 2 CPU cores
- 8 GB RAM
- 2 GB free disk space

The full verifier benchmark reruns may require more time and memory than the smoke tests. Some LF-side benchmarks are intentionally retained as resource-bound cases and may exceed the practical limits of the tested 8 GB machine.

## RMC setup for verifier benchmarks

The RMC jar is not bundled with this repository because it is an external tool.

To run the Timed Rebeca/RMC workflow, download `rmc-2.14.jar` and place it under:

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

You can verify that it is in place with:

```bash
ls -lh verifier-benchmarks/TR/tools/rmc-2.14.jar
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

## Installing Docker or a Docker-compatible runtime

The recommended first artifact check uses Docker. Docker lets the artifact run in a container so that Java and Maven do not need to be installed manually on the host machine.

Install one of the following:

- Docker Desktop: `https://www.docker.com/products/docker-desktop/`
- On macOS, a Docker-compatible alternative such as Colima can also be used.

After installing Docker or starting a Docker-compatible runtime, check that the `docker` command works:

```bash
docker --version
docker run hello-world
```

If using Colima on macOS, one setup path is:

```bash
brew install colima docker
colima start --runtime docker
docker run hello-world
```

Then build and run the ReLico artifact image from the repository root:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

The first command builds the image. The second command runs the core translator smoke test inside the image.

Expected final output includes a success message of the form:

```text
SUCCESS: generated ... LF files.
```

The Docker image covers the core translator smoke test only. It does not include the optional verifier tools (`RMC`, `lfc`, `Uclid5`, `Z3`) or the optional ESP32 hardware workflow.

## Installation for native execution

Clone the repository:

```bash
git clone https://github.com/sarmadiali98/ReLico
cd ReLico
```

Check Java and Maven for native execution:

```bash
java -version
mvn -version
```

Build the project natively:

```bash
mvn clean package -DskipTests
```

## Docker quickstart

The Docker quickstart is the recommended first artifact check for reviewers who want to avoid installing Java and Maven on the host system.

Build the image:

```bash
docker build -t relico-artifact .
```

Run the core translator smoke test:

```bash
docker run --rm relico-artifact
```

Expected result:

- the Java/Maven build succeeds inside the container,
- the ReLico compiler processes the benchmark `.rebeca` files,
- generated `.lf` files appear under `compiledLF/` or `CompiledLF/`,
- the script prints a final success message.

To check that the already-built image can run without network access:

```bash
docker run --rm --network none relico-artifact
```

This Docker image does **not** include the optional verifier toolchains or live ESP32 hardware dependencies. The verifier and hardware/replay workflows are documented separately.

## Running the compiler natively

The compiler processes Timed Rebeca input models and generates corresponding Lingua Franca files.

### Input models

Input `.rebeca` files are located under:

```text
benchmarks/
```

### Run command

Run the main class with Maven:

```bash
mvn org.codehaus.mojo:exec-maven-plugin:3.1.0:java \
  -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"
```

### Expected result

A successful run should:

- finish with `BUILD SUCCESS`,
- process the discovered `.rebeca` input files,
- generate corresponding `.lf` output files in the output directory.

### Output location

Generated LF files are written to one of the following output directories, depending on the execution environment and filesystem behavior:

```text
compiledLF/
CompiledLF/
```

## Quick smoke test

A complete native core-translator smoke test is:

```bash
mvn clean package -DskipTests
mvn org.codehaus.mojo:exec-maven-plugin:3.1.0:java \
  -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"
find compiledLF CompiledLF -maxdepth 2 -name "*.lf" 2>/dev/null
```

Example expectations:

- `pingpong.rebeca` produces a corresponding LF output,
- sample node/switch/router or sender/receiver benchmarks are translated successfully,
- the build ends with `BUILD SUCCESS`.

In our smoke tests, the `.rebeca` models under `benchmarks/` were processed and corresponding `.lf` files were generated.

## Hardware validation example

This repository also contains a **hardware-backed smart-home example** that demonstrates an end-to-end path from:

Timed Rebeca model → generated LF → adapted LF runtime → ESP32 sensor input → runtime property validation

This example is included to support the hardware-validation part of the paper. It is **not** required to use the core translator.

### Smart-home example contents

The smart-home example includes:

- a Timed Rebeca source model,
- a property file,
- a directly generated LF file,
- a hardware-adapted LF file,
- a Python serial bridge,
- ESP32 firmware,
- PlatformIO project configuration,
- a hardware-free replay script,
- recorded scenario logs.

### Hardware/software stack

The optional live hardware setup uses:

- **ESP32-WROOM-32 / esp32dev-style setup**
- **DHT22** on GPIO 27
- **LDR/light sensor** on GPIO 34
- **PIR motion detector** on GPIO 35
- **PlatformIO** with the **Arduino** framework
- serial output at **115200 baud**
- a Python bridge that stores the latest sensor readings in `sensor_data.jsonl`

### Important distinction

Two LF files are included in the smart-home example:

- `generated_smarthome.lf` is the raw LF file produced directly by ReLico.
- `smarthome.lf` is the hardware-adapted LF file used for replay and live sensor experiments.

The hardware-backed execution path uses the adapted LF version, which includes the extra integration needed to consume runtime sensor data. This should not be confused with the raw translator output.

### Hardware-free replay note

Live ESP32 reproduction is optional for artifact review. The smart-home directory contains a replay script and recorded scenario logs. This allows reviewers to inspect the expected `[EVENT]`, `[INFO]`, and `[PROPERTY]` markers without physically connecting the ESP32 setup.

See:

```text
examples/hardware/smarthome/README.md
examples/hardware/smarthome/run_scenario.sh
examples/hardware/smarthome/logs/
```

## Expected smart-home behavior

The smart-home example is designed around five validated properties:

- `FireKeepsDoorOpen`
- `FireOverridesIntrusion`
- `HeaterOffDuringFire`
- `EmergencyImpliesAlarmOrHistory`
- `LightOffDuringIntrusionOverride`

The evaluation scenarios include:

1. fire emergency,
2. intrusion with stealth mode,
3. fire overriding intrusion,
4. normal baseline operation,
5. cold-temperature heater activation.

These scenarios are validated through runtime event and property markers in the adapted LF execution path.

## Verification benchmark workflow

This repository also contains a **verification benchmark workflow** that supports the verification-oriented evaluation in the paper.

This part of the artifact is included to document how selected Timed Rebeca benchmarks were checked with RMC and how corresponding Lingua Franca benchmarks were checked using the LF/Uclid/Z3 verifier toolchain. It is **not** required to use the core Timed Rebeca → Lingua Franca translator.

The paired verification benchmark material has two sides:

- the Timed Rebeca/RMC workflow under `verifier-benchmarks/TR/`, and
- the Lingua Franca/Uclid/Z3 workflow under `verifier-benchmarks/LF/`.

### Verifier smoke-test scripts

The verifier benchmark directory includes helper scripts for checking the environment and running one representative TR/RMC and LF/Uclid/Z3 benchmark.

Before running this path, make sure the RMC jar is present:

```text
verifier-benchmarks/TR/tools/rmc-2.14.jar
```

Then, from the repository root:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
./scripts/run_smoke.sh
```

The smoke test runs:

- `AircraftDoor` through the Timed Rebeca/RMC workflow, and
- `AircraftDoor.lf` through the Lingua Franca/Uclid/Z3 workflow.

Expected results:

- the TR/RMC CSV reports `analysis_result=satisfied`, and
- the LF/Uclid/Z3 CSV reports `AircraftDoor,...,Valid,0,0,0,...`.

The smoke-test scripts are:

```text
verifier-benchmarks/scripts/check_env.sh
verifier-benchmarks/scripts/run_tr_smoke.sh
verifier-benchmarks/scripts/run_lf_smoke.sh
verifier-benchmarks/scripts/run_smoke.sh
```

### Verification benchmark contents

The verification benchmark material is organized into two parts:

- `verifier-benchmarks/TR/`  
  Timed Rebeca benchmark models.

- `verifier-benchmarks/LF/`  
  Lingua Franca benchmark models and the supporting verification workflow, including:
  - generated or adapted LF benchmark programs,
  - benchmark-running scripts,
  - environment configuration,
  - raw result logs,
  - CSV summaries of the final benchmark run.

### Provenance note

The LF-side benchmark workflow in this repository is **adapted** from the public **LF Verifier Benchmarks** repository maintained by the Lingua Franca project:

- Repository: `https://github.com/lf-lang/lf-verifier-benchmarks`
- Associated paper: `https://dl.acm.org/doi/full/10.1145/3609134`

That benchmark suite was developed for prior work on Lingua Franca property verification. In this repository, the benchmark infrastructure is reused and adapted for the purposes of the present work.

### Verification toolchain

The verification benchmark workflow assumes a local installation of:

- **Lingua Franca (`lfc`)**
- **Uclid5**
- **Z3**
- **RMC 2.14** for the Timed Rebeca/RMC side

The helper script `verifier-benchmarks/scripts/check_env.sh` checks whether the expected tools are available on the current machine.

### Important distinction

This benchmark workflow should be distinguished from both:

- the **core translation workflow**, whose purpose is to generate LF from Timed Rebeca, and
- the **hardware-backed smart-home workflow**, whose purpose is runtime validation on physical hardware.

The verification benchmark workflow is specifically for **offline property-checking experiments** on TR and LF models.

### Expected benchmark artifacts

Depending on the benchmark and the verifier outcome, the LF verification workflow may generate:

- `.ucl` verification models,
- `.dot` state-space or model graphs,
- `.smt` formulas produced from Uclid5,
- `.json` counterexample traces for violated properties,
- raw `.txt` timing/result logs,
- summarized `.csv` result tables.

### Reproducing the verification benchmark run

The smoke-test path is recommended first:

```bash
cd verifier-benchmarks
./scripts/run_smoke.sh
```

To rerun the full Timed Rebeca/RMC benchmark set:

```bash
cd verifier-benchmarks/TR
python3 tools/batch_rmc.py
```

A successful TR/RMC run writes a CSV summary under:

```text
verifier-benchmarks/TR/_cli_runs/results.csv
```

To rerun the full Lingua Franca/Uclid/Z3 benchmark set:

```bash
cd verifier-benchmarks/LF
./scripts/run-benchmarks benchmarks
```

A successful LF/Uclid/Z3 run writes benchmark logs and a CSV summary under:

```text
verifier-benchmarks/LF/results/
```

### Recommended use in this repository

If you are evaluating the translation itself, the main compiler workflow is sufficient.

If you want to inspect the verification-oriented evaluation used in the paper, first run the verifier smoke-test scripts and then use the TR/RMC and LF/Uclid/Z3 full benchmark workflows if needed.

## Result files and paper-related tables

The repository includes result summaries that support the verification comparison in the paper.

Verification result summaries are stored in:

```text
verifier-benchmarks/TR/sample_results.csv
verifier-benchmarks/LF/results/
```

The paper’s verification comparison table is derived from the CSV fields for:

- benchmark name,
- verification outcome,
- exit codes,
- generated model size or communication-bound fields,
- timing measurements,
- and whether downstream verification artifacts were generated successfully.

The full verifier reruns regenerate these CSV files:

```bash
cd verifier-benchmarks/TR
python3 tools/batch_rmc.py

cd ../LF
./scripts/run-benchmarks benchmarks
```

The smart-home validation claims are supported by:

```text
examples/hardware/smarthome/logs/hardware-scenarios/*.log
examples/hardware/smarthome/logs/hardware-property-markers.log
examples/hardware/smarthome/logs/hardware-scenarios-summary.log
```

These logs contain the `[EVENT]`, `[INFO]`, and `[PROPERTY]` markers used to validate the five reported smart-home scenarios.

## Reproducing paper-related results

This repository supports three different levels of use.

### 1. Core translation workflow

Use the translator on example or benchmark Timed Rebeca inputs and inspect the generated LF outputs.

### 2. End-to-end smart-home workflow

Use the smart-home directory to reproduce or inspect the hardware-backed example with:

- ESP32 firmware,
- PlatformIO upload/monitor,
- Python serial bridge,
- hardware-adapted LF program,
- hardware-free replay script,
- recorded event/property logs.

Live ESP32 reproduction is optional for artifact review. The replay script and included logs are sufficient to inspect the event and property markers reported in the paper.

### 3. Verification benchmark workflows

Use the verification benchmark directory to reproduce the TR/RMC and LF/Uclid/Z3 verification experiments and inspect the generated logs, timing summaries, and derived benchmark data.

If you only want to evaluate the translator itself, the first workflow is sufficient.

## Artifact contents not included in Git

The repository intentionally does not include generated build outputs, virtual environments, local environment logs, or external binary tools.

In particular, the following are not committed:

- Maven `target/` directories
- generated Lingua Franca build directories
- Python virtual environments
- PlatformIO build directories
- local `artifact-env-info*` logs/tarballs
- `rmc-2.14.jar`
- generated RMC run directories such as `verifier-benchmarks/TR/_cli_runs/`
- generated LF smoke-test directories such as `verifier-benchmarks/LF/_smoke/`
- generated translator output directories such as `compiledLF/` or `CompiledLF/`

The RMC jar must be downloaded separately following the instructions above and in `verifier-benchmarks/README.md`.

## Common issues

### Docker is not installed

Install Docker Desktop or another Docker-compatible runtime.

On macOS, Docker Desktop or Colima can be used. With Colima, the standard Docker CLI commands still apply after starting the runtime:

```bash
colima start --runtime docker
docker run hello-world
```

Then rerun:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

### Docker cannot pull base images or download packages

The first Docker build may require network access to download the Ubuntu base image and package dependencies. If the build fails due to network instability, rerun:

```bash
docker build -t relico-artifact .
```

After the image has been built successfully, the core smoke test can be run without network access:

```bash
docker run --rm --network none relico-artifact
```

### Maven not installed

Install Maven with your package manager:

```bash
brew install maven
```

or:

```bash
sudo apt install maven
```

Alternatively, use the Docker quickstart, which does not require Maven to be installed on the host.

### Dependency resolution issues

Try:

```bash
mvn dependency:resolve
```

### Java version mismatch

Make sure `java -version` reports JDK 17 or newer.

### No output files generated

Check that:

- input `.rebeca` files are placed in the expected input directory,
- the project builds successfully,
- the compiler is using the directory layout you expect.

### Smart-home serial bridge does not connect

If you are using the hardware example, edit the serial port in `serial_bridge.py` to match your system.

### LF benchmark script cannot find tools

If you are using the verification benchmark workflow, first run:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

The checker reports whether `java`, `javac`, `python3`, `c++`, `lfc`, `uclid`, `z3`, and `rmc-2.14.jar` are available. If any tool is missing, install or place it on your `PATH` before running the verifier smoke tests.

### RMC jar is missing

If the TR/RMC workflow fails because `rmc-2.14.jar` is missing, download it with:

```bash
mkdir -p verifier-benchmarks/TR/tools

curl -L \
  -o verifier-benchmarks/TR/tools/rmc-2.14.jar \
  https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar
```

Then rerun:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

## License

ReLico is distributed under the **GNU GPL v2.0**; see `LICENSE`.

This repository includes or adapts work built on the Rebeca compiler framework and should retain the associated license and provenance notices.

Unless explicitly stated otherwise, the example files in this repository are distributed under the same license as the main project.

## Third-party software and dependencies

This repository may rely on third-party software and libraries that remain under their own licenses.

Examples include:

- Docker or a Docker-compatible runtime,
- Maven dependencies used by the Java compiler project,
- PlatformIO,
- Arduino framework for ESP32,
- Adafruit DHT Sensor Library,
- Adafruit Unified Sensor,
- Lingua Franca,
- Uclid5,
- Z3,
- RMC.

These dependencies are not relicensed by this repository.

## Citation

If you use ReLico in academic work, please cite:

1. the associated ReLico paper and archived artifact release, and
2. the prior LF verification benchmark infrastructure when using or discussing the adapted verification benchmark workflow in this repository.

The LF-side verification benchmark workflow included here is adapted from:

- **LF Verifier Benchmarks**  
  `https://github.com/lf-lang/lf-verifier-benchmarks`

The adapted benchmark workflow is associated with the prior paper:

- **Towards Building Verifiable CPS using Lingua Franca**  
  ACM Transactions on Embedded Computing Systems, 2023  
  DOI: `10.1145/3609134`  
  URL: `https://dl.acm.org/doi/full/10.1145/3609134`

If you use the verification benchmark portion of this repository, cite that paper in addition to the present work.

## Notes for artifact evaluation

For artifact-review purposes, the most important distinctions are:

- the core contribution is the Timed Rebeca → Lingua Franca translator,
- the Docker quickstart covers the core translator smoke test,
- the supported source language is a deterministic subset of Timed Rebeca,
- the smart-home example is an end-to-end validation workflow,
- the hardware-backed LF program contains additional integration beyond the raw generated LF file,
- live ESP32 reproduction is optional because hardware-free replay logs are included,
- the verification benchmark workflow is a separate evaluation harness adapted from prior LF-verification-benchmark infrastructure and should be treated as such in reproduction and citation contexts.

The main reproducibility paths are:

1. build and run the core ReLico translator with Docker,
2. build and run the core ReLico translator natively with Java/Maven,
3. run the Timed Rebeca/RMC smoke test,
4. run the Lingua Franca/Uclid/Z3 smoke test,
5. inspect or rerun the smart-home replay scenarios.

The recommended first reviewer command for the core translator is:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

The recommended first reviewer command for the verifier workflows is:

```bash
cd verifier-benchmarks
./scripts/run_smoke.sh
```

This avoids requiring reviewers to manually reconstruct the benchmark commands. The script checks the environment, runs the TR/RMC `AircraftDoor` benchmark, and runs the LF/Uclid/Z3 `AircraftDoor` benchmark using a temporary one-benchmark LF directory.
