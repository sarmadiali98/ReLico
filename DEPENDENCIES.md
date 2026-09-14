# External Dependencies

Every external dependency of the ReLico artifact, with exact version, source,
checksum, acquisition method, purpose, and license. Machine-readable checksums
live in [`artifact/checksums.tsv`](artifact/checksums.tsv).

Checksum status vocabulary: **verified** = freshly downloaded by this project and
SHA-256-checked; **upstream** = digest published by the upstream release (GitHub
release API); binary-level SHA values are recorded only after acquisition of the
exact binary.

## Required for reproduction

### Lean toolchain
- Version: 4.32.1 (pinned in `lean-toolchain`)
- Source: `leanprover/lean4:v4.32.1` (installed via elan; CI uses `leanprover/lean-action@v1`)
- Checksum: tag-pinned, no artifact checksum
- Purpose: Lean proofs, translator, exporter runs (`lake build`, `lake env lean --run`), aggregate tests
- License: Apache-2.0
- Note: `lake-manifest.json` declares zero third-party Lean packages.

### Lingua Franca compiler (lfc)
- Version: 0.11.0
- Source: https://github.com/lf-lang/lingua-franca/releases/tag/v0.11.0
- Artifacts: per-platform `lf-cli-0.11.0-<OS>-<arch>.tar.gz` (see `artifact/checksums.tsv`)
- Verified binary: extracted `bin/lfc` on macOS-aarch64 hashes to
  `a8e277076ef578a677fdf7731d95d3ee745e47266ea68d37a673f44bf069cf8a`
  (enforced at runtime by `tools/relico_bench_stage.py` `lfc_stage`).
  Binary-level SHA for other platforms is recorded at acquisition time; tarball
  digests are upstream-published and listed in `artifact/checksums.tsv`.
- Acquisition: `scripts/install-dependencies.sh --with-lfc` downloads the
  release asset into `~/.cache/relico/lf/0.11.0/<platform>/` and prints the
  extracted binary path; add that `bin/` directory to `PATH` before running
  the artifact. No system-wide installation is performed.
- Purpose: compiles generated LF to C++ and produces the native executable
- License: BSD-2-Clause
- Transitively requires: a C++ compiler, `cmake`, `make` on PATH (lfc drives the
  generated build).

### Rebeca Model Checker (RMC)
- Version: 2.14 (tag `2.14`, commit `1b21e27e38ef4dfb44463358ba5bf389654dc998`)
- Source: https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar
- Checksum (SHA-256): `a39112046d99e0895cf47f890242ace21db896e609f7eef86751a0d416d477f5` — verified
- Acquisition: `scripts/install-dependencies.sh` caches it at
  `~/.cache/relico/rmc/2.14/rmc-2.14.jar` (the path the committed manifests use)
- Purpose: Timed Rebeca model checking (`rmc` / `rmc-properties` stages; enforced by `tools/relico_bench_stage.py`)
- License: GPL-2.0 (fat JAR additionally carries notices for bundled dependencies)
- Requires: Java 17+; a C++ compiler for the generated checker

### Rebeca parser/compiler
- Version: 2.25, commit `94ca579e0f2e3528d8de608a9e86316ecb78d608`
- Source: https://github.com/rebeca-lang/org.rebecalang.compiler/archive/94ca579e0f2e3528d8de608a9e86316ecb78d608.zip
- Checksum (SHA-256): `bd10366acf8d1ed7f392cdd424bfaea5be162cb291f9521ad3d3cfd32be8dcaf` — verified (fresh download)
- Acquisition: `scripts/install-dependencies.sh` caches it at
  `~/.cache/relico/parser/2.25/org.rebecalang.compiler-94ca579e0f2e3528d8de608a9e86316ecb78d608.zip`
  (the exact filename `tests/translator/general--main-actor-priority--negative/run-test.sh`
  expects; `RELICO_PARSER_ARTIFACT` remains the offline override)
- Purpose: trusted Timed Rebeca parser/type checker; the java-bridge exporters are compiled and run on top of it
- License: GPL-2.0
- Note: the legacy packaging `ReLico-fmcad-2026-artifact-v1.zip`
  (`b5805295...dc41586`) is the same compiler at the same commit and is
  superseded by the canonical GitHub archive; it is kept only as a legacy
  reference row in `artifact/checksums.tsv`.

### Apache Maven
- Version: 3.9.16 (the version used in all recorded runs; the committed
  manifests pin `/opt/homebrew/Cellar/maven/3.9.16/bin/mvn`; `RELICO_MAVEN`
  overrides the executable)
- Source: https://maven.apache.org/download.cgi (or OS package manager)
- Purpose: builds the parser bridge and runs the JSON exporters (`exec-maven-plugin` 3.1.0 is pinned in the runner scripts)
- License: Apache-2.0
- Note: `mvn package` fetches the compiler project's transitive dependencies
  from Maven Central at build time; these are documented as a class
  (unpinned upstream artifacts) here and are baked into the Docker image build
  in a later phase.

### Java JDK
- Version: 17 or later (recorded runs used Oracle JDK 21.0.1)
- Source: e.g. Eclipse Temurin https://adoptium.net (or system JDK)
- Purpose: runs Maven, lfc, and RMC
- License: GPLv2 with Classpath Exception (Temurin/OpenJDK builds)

### Python
- Version: 3.10+ (recorded runs used 3.11.6); selected via `RELICO_PYTHON` or PATH
- Purpose: test/benchmark harness (`tools/`, `frontend/`); standard library only
- License: PSF-2.0

### C/C++ toolchain and build tools
- Components: `clang++` or `g++`, `make`, `cmake`, `git`, `curl` (or `wget`), `tar`, `unzip`
- Purpose: RMC-generated checker compilation; lfc-generated C++ builds; repo-root resolution in runners
- License: per distribution

## Required for the ESP32 case-study test suites

### pytest
- Version: 9.1.1 in recorded runs; any recent 9.x
- Source: https://pypi.org/project/pytest/ (`python3 -m pip install pytest`)
- Purpose: only the ESP32 suites (`esp32/smarthome/hardware/tests/`,
  `esp32/smarthome/bridge/tests/`, `esp32/smarthome/scenario/tests/`);
  the core harness (`tools/`, `tests/catalog`, `frontend/`) is
  `unittest`-based and does not need pytest
- License: MIT

## Optional — live hardware path only (not required for reproduction)

These are needed only for the ESP32 firmware/serial workflow documented in
`esp32/smarthome/docs/ARTIFACT_REPRODUCTION.md` §6. All committed runtime
evidence was produced by the virtual runner and does not need them.

### pyserial
- Version: unpinned; any current release
- Source: https://pypi.org/project/pyserial/
- Purpose: ESP32 serial bridge (`esp32/smarthome/bridge/serial_bridge.py`); bridge tests stub it
- License: BSD-3-Clause

### PlatformIO CLI (pio)
- Version: unpinned
- Source: https://platformio.org/ (also `esp32/smarthome/firmware/platformio.ini`)
- Purpose: firmware build/upload for physical ESP32 hardware
- License: Apache-2.0

## Environment variables

| Variable | Used by | Meaning |
|---|---|---|
| `RELICO_PYTHON` | `tools/relico_test.sh`, `tools/relico_bench.sh` | Python 3.10+ executable override |
| `RELICO_PARSER_ARTIFACT` | `tests/translator/.../run-test.sh` | digest-identical parser ZIP for offline use |
| `RELICO_PARSER_CACHE` | same | parser ZIP cache directory (default `~/.cache/relico/parser/2.25`) |
| `RELICO_MAVEN` | `frontend/java-bridge/run-*-from-zip.sh` | Maven executable path |
| `RELICO_REPO_ROOT` | `run-test.sh` | repository root override |
| `RELICO_GENERAL_BUILD_DIR` | `run-general-from-zip.sh` | opt-in shared Maven build cache |
| `RELICO_GENERAL_RECORDING` | `frontend/test_validate_general_v1.py` | recording-mode gate |
| `RELICO_CACHE_DIR` | `scripts/install-dependencies.sh`, `scripts/verify-environment.sh` | artifact cache root (default `~/.cache/relico`) |
