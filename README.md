# ReLico: Timed Rebeca to Lingua Franca Compiler

ReLico is a compiler from **Timed Rebeca** to **Lingua Franca (LF)**.

This repository accompanies the RELICO work on bridging **formally verified Timed Rebeca models** to **executable Lingua Franca programs**. The goal is to reduce the gap between formal verification and deployment by automatically translating verified models into a deterministic, time-aware execution framework.

## Overview

Timed Rebeca is an actor-based language for modeling and verifying concurrent and real-time systems. Lingua Franca is a deterministic coordination language based on the reactor model. ReLico translates a deterministic subset of Timed Rebeca into Lingua Franca while preserving the timing and scheduling structure needed for execution and analysis.

In particular, ReLico:

- translates **Deterministic Timed Rebeca (DTR)** models into **Lingua Franca**
- maps actor/message-server structure to reactors, ports, actions, and reactions
- preserves local message-server priority using LF reaction declaration order
- translates timing behavior based on the `after(...)` construct
- generates LF code targeting the **C++ runtime**

## Relation to the paper

This repository is the implementation artifact for the RELICO paper.

The paper contributes:

1. a mapping from Timed Rebeca to Lingua Franca,
2. an implementation of the translation in the RELICO tool,
3. an operational argument for behavioral equivalence between the source and target semantics, and
4. benchmark and example-based evaluation, including a hardware-backed smart-home example.

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

- `compiledLF/`  
  Generated Lingua Franca output files.

- `examples/hardware/smarthome/`  
  hardware-validation example, including:
  - Timed Rebeca source model,
  - property specification,
  - generated LF,
  - hardware-adapted LF,
  - Python serial bridge,
  - ESP32 firmware created with PlatformIO.

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
- `self.m() after(t)` → `action.schedule(t)`
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
- 4 GB RAM
- 2 GB free disk space

## Installation

Clone the repository:

```bash
git clone https://github.com/sarmadiali98/ReLico.git
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

## hardware validation example

This repository also contains an ** hardware-backed smart-home example** that demonstrates an end-to-end path from:

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

## Reproducing paper-related results

This repository supports two different levels of use:

### 1. Core translation workflow

Use the translator on example or benchmark Timed Rebeca inputs and inspect the generated LF outputs.

### 2. End-to-end smart-home workflow

Use the smart-home directory to reproduce the hardware-backed example with:

* ESP32 firmware
* PlatformIO upload/monitor
* Python serial bridge
* hardware-adapted LF program

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

## License

ReLico is distributed under the **GNU GPL v2.0**; see `LICENSE`.

This repository includes or adapts work built on the Rebeca compiler framework, publicly available at https://github.com/rebeca-lang/org.rebecalang.compiler, and should retain the associated license and provenance notices.

Unless explicitly stated otherwise, the example files in this repository are distributed under the same license as the main project.

## Third-party software and dependencies

This repository may rely on third-party software and libraries that remain under their own licenses.

Examples include:

* Maven dependencies used by the Java compiler project
* PlatformIO
* Arduino framework for ESP32
* Adafruit DHT Sensor Library
* Adafruit Unified Sensor

These dependencies are not relicensed by this repository.

## Citation

If you use ReLico in academic work, please cite the associated paper and the archived artifact release.

## Notes for artifact evaluation

For artifact-review purposes, the most important distinctions are:

* the core contribution is the Timed Rebeca → Lingua Franca translator,
* the supported source language is a deterministic subset of Timed Rebeca,
* the smart-home example is an end-to-end validation workflow,
* the hardware-backed LF program contains additional integration beyond the raw generated LF file.
