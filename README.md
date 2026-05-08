# ReLico: Timed Rebeca to Lingua Franca Compiler

ReLico is a compiler from **Timed Rebeca** to **Lingua Franca (LF)**.

This repository accompanies the ReLico work on bridging **formally verified Timed Rebeca models** to **executable Lingua Franca programs**. Its purpose is to reduce the gap between formal verification and deployment by automatically translating verified models into a deterministic, time-aware execution framework.

This repository is also the artifact package for the ReLico paper. It contains the core translator, verification benchmark material, and a hardware-backed smart-home validation example.

## Artifact at a glance

The artifact has three main parts.

| Part | Location | Purpose | Recommended first check |
|---|---|---|---|
| Core translator | `src/`, `benchmarks/` | Timed Rebeca to Lingua Franca translation | Docker smoke test |
| Verification benchmarks | `verifier-benchmarks/` | TR/RMC vs LF/Uclid/Z3 model-level verification comparison | `verifier-benchmarks/scripts/run_smoke.sh` |
| Smart-home example | `examples/hardware/smarthome/` | Hardware/replay validation of translated LF behavior | `run_scenario.sh` replay |

For complete workflow-specific instructions, see:

- Core translator and Docker smoke test: this root `README.md`
- Verifier benchmark workflows: `verifier-benchmarks/README.md`
- Smart-home replay and optional live hardware workflow: `examples/hardware/smarthome/README.md`

## Recommended reviewer path

The fastest first check is the Docker-based core translator smoke test.

From the repository root:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

Expected result:

- the Java/Maven build succeeds inside the container,
- the ReLico compiler processes the `.rebeca` models under `benchmarks/`,
- generated `.lf` files appear under `compiledLF/` or `CompiledLF/`,
- the script prints a final success message such as:

```text
SUCCESS: generated ... LF files.
```

After the image has been built, the same smoke test can be run without network access:

```bash
docker run --rm --network none relico-artifact
```

The Docker image is intentionally limited to the **core translator smoke test**. It does not include the optional verifier toolchains (`RMC`, `lfc`, `Uclid5`, `Z3`) or the optional ESP32/PlatformIO live-hardware workflow.

## Installing Docker or a Docker-compatible runtime

The Docker smoke test lets reviewers run the core artifact without manually installing Java or Maven.

Install one of the following:

- Docker Desktop: `https://www.docker.com/products/docker-desktop/`
- On macOS, a Docker-compatible runtime such as Colima can also be used.

After installation, check that Docker works:

```bash
docker --version
docker run hello-world
```

On macOS with Colima, one setup path is:

```bash
brew install colima docker
colima start --runtime docker
docker run hello-world
```

Then return to the repository root and run:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

## Other artifact checks

### Native core translator smoke test

This path runs the translator directly on the host machine. It requires Java 17+ and Maven.

```bash
mvn clean package -DskipTests
mvn org.codehaus.mojo:exec-maven-plugin:3.1.0:java \
  -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"
find compiledLF CompiledLF -maxdepth 2 -name "*.lf" 2>/dev/null
```

Expected result:

- the Java/Maven build succeeds,
- the compiler processes the `.rebeca` files under `benchmarks/`,
- generated `.lf` files appear under `compiledLF/` or `CompiledLF/`.

### Verifier benchmark smoke test

This checks one representative benchmark through both verifier workflows:

- `AircraftDoor` through the Timed Rebeca/RMC workflow,
- `AircraftDoor.lf` through the Lingua Franca/Uclid/Z3 workflow.

The RMC jar is not included in this repository because it is an external tool. Before running this path, download `rmc-2.14.jar` and place it at:

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

Then run:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
./scripts/run_smoke.sh
```

Expected result:

- the TR/RMC CSV reports `analysis_result=satisfied`,
- the LF/Uclid/Z3 CSV reports `AircraftDoor,...,Valid,0,0,0,...`.

For complete setup, full reruns, expected outputs, result interpretation, and Table V mapping, see:

```text
verifier-benchmarks/README.md
```

### Smart-home replay

This checks the smart-home case study without requiring physical ESP32 hardware.

```bash
cd examples/hardware/smarthome
lfc smarthome.lf
./run_scenario.sh scenario-3-fire-overrides-intrusion 38.0 40.0 1 1 10
```

Expected result:

- a log is written under `logs/hardware-scenarios/`,
- the log contains `[EVENT]`, `[INFO]`, and `[PROPERTY]` markers,
- the fire-overriding-intrusion scenario reports markers such as:
  - `FireOverridesIntrusion`
  - `FireKeepsDoorOpen`
  - `HeaterOffDuringFire`
  - `EmergencyImpliesAlarmOrHistory`

For complete replay, logging, Table IV mapping, and optional live ESP32 instructions, see:

```text
examples/hardware/smarthome/README.md
```

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
| Full TR/RMC benchmark rerun | `cd verifier-benchmarks/TR && python3 tools/batch_rmc.py` | several minutes, machine-dependent |
| Full LF/Uclid/Z3 benchmark rerun | `cd verifier-benchmarks/LF && ./scripts/run-benchmarks benchmarks` | several minutes; demanding cases may hit resource limits |

## Repository layout

```text
ReLico/
├── Dockerfile
├── LICENSE
├── README.md
├── pom.xml
├── scripts/
│   └── docker_smoke_test.sh
├── src/
│   └── main/java/
├── benchmarks/
├── verifier-benchmarks/
│   ├── README.md
│   ├── scripts/
│   ├── TR/
│   └── LF/
└── examples/
    └── hardware/
        └── smarthome/
            └── README.md
```

Important locations:

- `src/main/java/`  
  Main Java compiler implementation.

- `src/main/java/org/rebecalang/compiler/RebecaCompilerMain.java`  
  Main entry point.

- `src/main/java/org/rebecalang/compiler/modelcompiler/linguafranca/`  
  Timed Rebeca to Lingua Franca translation logic.

- `benchmarks/`  
  Example Timed Rebeca input models.

- `verifier-benchmarks/`  
  Verification-oriented comparison between TR/RMC and LF/Uclid/Z3 workflows.

- `examples/hardware/smarthome/`  
  Smart-home hardware/replay validation example.

## Requirements

The artifact is organized so reviewers do **not** need to install every tool for every path.

### Core translator

For the Docker workflow:

- Docker or a Docker-compatible container runtime.

For native execution:

- Java Development Kit 17 or later.
- Maven.

### Verifier benchmark smoke/full reruns

The verifier workflows require:

- Python 3
- Java and Javac
- a C++ compiler available as `c++`
- RMC 2.14
- Lingua Franca compiler (`lfc`)
- Uclid5
- Z3

The verifier environment checker is:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

### Smart-home replay

The hardware-free replay requires:

- Lingua Franca compiler (`lfc`)
- C++ compiler supported by the LF C++ target

### Optional live ESP32 workflow

The live hardware workflow is optional and requires:

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
- Uclid 0.9.5
- Z3 available through the local Uclid/Z3 setup
- RMC 2.14
- Docker-compatible runtime tested through Colima/Docker CLI for the core Docker path

Used for:

- core translator build/smoke test,
- Docker core translator smoke test,
- Timed Rebeca/RMC verifier smoke test,
- Lingua Franca/Uclid/Z3 verifier smoke test,
- smart-home replay,
- live ESP32 hardware workflow.

On macOS, if Uclid and Z3 are installed locally but not on `PATH`, add their directories before running the verifier scripts. For example:

```bash
export PATH="$HOME/uclid/target/universal/uclid-0.9.5/bin:$PATH"
export PATH="$HOME/uclid/z3/bin:$PATH"
export DYLD_LIBRARY_PATH="$HOME/uclid/z3/bin:${DYLD_LIBRARY_PATH:-}"
```

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

Used for:

- core translator build/smoke test,
- Timed Rebeca/RMC verifier smoke test,
- Lingua Franca/Uclid/Z3 verifier smoke test.

Recommended minimum resources:

- 2 CPU cores
- 8 GB RAM
- 2 GB free disk space

The full verifier benchmark reruns may require more time and memory than the smoke tests. Some LF-side benchmarks are intentionally retained as resource-bound cases and may exceed the practical limits of the tested 8 GB machine.

## ReLico overview

Timed Rebeca is an actor-based language for modeling and verifying concurrent and real-time systems. Lingua Franca is a deterministic coordination language based on the reactor model. ReLico translates a deterministic subset of Timed Rebeca into Lingua Franca while preserving the timing and scheduling structure needed for execution and analysis.

ReLico:

- translates **Deterministic Timed Rebeca (DTR)** models into **Lingua Franca**,
- maps actor/message-server structure to reactors, ports, actions, and reactions,
- preserves local message-server priority using LF reaction declaration order,
- translates timing behavior based on the `after(...)` construct,
- generates LF code targeting the **C++ runtime**.

## Supported subset

ReLico currently targets a deterministic subset of Timed Rebeca.

Supported assumptions include:

- actor execution is deterministic,
- scheduling conflicts are resolved by explicit `@priority(...)`,
- the `after(...)` timing primitive is supported,
- `delay` and `deadline` are not part of the supported subset.

The generated LF uses:

- reactors,
- input and output ports,
- state,
- logical actions,
- reactions,
- main-reactor connections.

The mapping does not rely on full LF features such as timers, physical actions, methods, or hierarchical models.

Important limitation:

- A known out-of-scope case is the transmission of identical simultaneous back-to-back messages from a single sender to the exact same target at the exact same logical time. This is excluded to avoid introducing extra manual queuing mechanisms in generated LF state.

## Paper-result evidence

The artifact includes logs and result summaries so that key reported results can be inspected without requiring full experiment reruns.

### Table IV: Hardware validation scenarios and observed properties

Table IV is supported by:

```text
examples/hardware/smarthome/logs/hardware-scenarios/*.log
examples/hardware/smarthome/logs/hardware-property-markers.log
examples/hardware/smarthome/logs/hardware-scenarios-summary.log
```

The property-to-scenario mapping is documented in:

```text
examples/hardware/smarthome/README.md
```

The observed mapping is:

| Property | Scenario(s) |
|---|---:|
| `FireKeepsDoorOpen` | 1, 3 |
| `FireOverridesIntrusion` | 3 |
| `HeaterOffDuringFire` | 1, 3 |
| `EmergencyImpliesAlarmOrHistory` | 1, 2, 3 |
| `LightOffDuringIntrusionOverride` | 2 |

### Table V: Model-level verification comparison

Table V is supported by:

```text
verifier-benchmarks/TR/sample_results.csv
verifier-benchmarks/LF/results/
```

The table is derived from the TR/RMC and LF/Uclid/Z3 CSV fields for:

- benchmark name,
- verification outcome,
- exit codes,
- generated model size or communication-bound fields,
- timing measurements,
- whether downstream verification artifacts were generated successfully.

The exact field mapping and rerun commands are documented in:

```text
verifier-benchmarks/README.md
```

## Generated files not included in Git

The repository intentionally does not include generated build outputs, local environment logs, or external binary tools.

Not committed:

- Maven `target/` directories
- generated Lingua Franca build directories
- Python virtual environments
- PlatformIO build directories
- local `artifact-env-info*` logs/tarballs
- `rmc-2.14.jar`
- generated RMC run directories such as `verifier-benchmarks/TR/_cli_runs/`
- generated LF smoke-test directories such as `verifier-benchmarks/LF/_smoke/`
- generated translator output directories such as `compiledLF/` or `CompiledLF/`

The RMC jar must be downloaded separately as described above and in `verifier-benchmarks/README.md`.

## Common issues

### Docker is not installed

Install Docker Desktop or another Docker-compatible runtime. On macOS, Docker Desktop or Colima can be used.

With Colima:

```bash
colima start --runtime docker
docker run hello-world
```

Then rerun:

```bash
docker build -t relico-artifact .
docker run --rm relico-artifact
```

### Docker build fails because of network access

The first Docker build may require network access to download the Ubuntu base image and package dependencies. If the build fails due to network instability, rerun:

```bash
docker build -t relico-artifact .
```

After the image has been built successfully, the core smoke test can be run without network access:

```bash
docker run --rm --network none relico-artifact
```

### Maven is not installed

Install Maven with your package manager:

```bash
brew install maven
```

or:

```bash
sudo apt install maven
```

Alternatively, use the Docker quickstart, which does not require Maven to be installed on the host.

### RMC jar is missing

Download it with:

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

### LF verifier tools are not on `PATH`

Run:

```bash
cd verifier-benchmarks
./scripts/check_env.sh
```

The checker reports whether `java`, `javac`, `python3`, `c++`, `lfc`, `uclid`, `z3`, and `rmc-2.14.jar` are available.

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
