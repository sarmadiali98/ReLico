# ReLico Artifact Quick Start

This is the reviewer-facing entry point for the ReLico artifact. It gives the
shortest verified path from a clean checkout to a reproduced result. For the
conceptual overview, scope, and formal claims, read [`README.md`](README.md)
first; for the exact trusted boundary see
[`docs/trusted-boundary.md`](docs/trusted-boundary.md).

Every script below writes only to a temporary output directory and never
modifies the repository.

## 0. What you need

The Lean toolchain is pinned in `lean-toolchain` and installed via `elan`.
Source-to-runtime execution additionally needs an external toolchain: a Java
JDK 17+, Apache Maven, `lfc` 0.11.0, a C++ compiler with `cmake`/`make`, and
Python 3.10+. Exact versions, sources, checksums, and licenses are listed in
[`DEPENDENCIES.md`](DEPENDENCIES.md).

A native (non-container) checkout is the supported path today. A packaged
container image is a later phase and is not required to reproduce the reported
results.

## 1. Install and verify the toolchain

```bash
# Downloads lfc, the RMC jar, and the pinned parser archive into ~/.cache/relico
# (no system-wide install). Omit and install manually if you prefer.
scripts/install-dependencies.sh

# Confirms every required tool is visible and reports its version.
scripts/verify-environment.sh
```

If a tool lives somewhere non-standard, point the matching `RELICO_*` variable
at it (see the environment-variable table in [`DEPENDENCIES.md`](DEPENDENCIES.md)).

## 2. Run the smoke test

```bash
./smoke-test.sh
```

One command, six gates, a few seconds warm: environment check, Lean build,
`scripts/relico analyze`, DTR model checking, LF compilation, and native
execution of the bundled `examples/smoke/minimal.rebeca`. A successful run ends
with:

```text
Artifact status: READY
```

This is a fast end-to-end confidence check, not the full evaluation. Add
`--verbose` to print captured tool versions. Logs land under
`/tmp/relico-artifact-smoke.<pid>/`.

## 3. Run an example through the workflow

```bash
scripts/relico analyze examples/smoke/minimal.rebeca
scripts/relico run     examples/smoke/minimal.rebeca
```

`analyze` accepts the model, reports the supported fragment, and validates
priorities (parse and decode only). `run` drives the full verified pipeline —
analyze, DTR model checking, translation to LF, `lfc` compilation, and a short
runtime — and writes a machine-readable `report.json` into its output
directory. Committed example outputs and a field-by-field explanation are in
the [user workflow guide](examples/workflow/README.md).

## 4. Reproduce the evaluation

```bash
scripts/reproduce.sh                 # quick reviewer profile (default)
scripts/reproduce.sh --profile full  # complete evaluation
```

The quick profile runs the environment check, the formal build, a
representative slice of the translator fixtures, the smallest benchmarks, and
the ESP32 virtual-hardware case study. The full profile runs all 65 translator
capability fixtures and all 41 application benchmarks. The full profile stays
offline provided the parser archive is already cached (step 1). See
[`evaluation/README.md`](evaluation/README.md) for the evidence populations and
counting rules, and [`benchmarks/README.md`](benchmarks/README.md) for the
benchmark suite.

## 5. Reproduce the ESP32 case study (optional)

```bash
lfc esp32/smarthome/hardware/smarthome.lf
esp32/smarthome/scenario/run_virtual_hardware.sh --all
```

The complete reproduction commands, checksums, and evidence roles are in
[`esp32/smarthome/README.md`](esp32/smarthome/README.md) and
[`esp32/smarthome/docs/ARTIFACT_REPRODUCTION.md`](esp32/smarthome/docs/ARTIFACT_REPRODUCTION.md).

## Where results and logs go

| Script | Output location |
|---|---|
| `./smoke-test.sh` | `/tmp/relico-artifact-smoke.<pid>/` |
| `scripts/relico ...` | `/tmp/relico-workflow.<timestamp>/` (override with `--out`) |
| `scripts/reproduce.sh` | `/tmp/relico-reproduce.<timestamp>/` (override with `--results`) |

## Troubleshooting

- A cold first `lake build` can take several minutes; the smoke test surfaces
  this as the Lean-build gate.
- `scripts/verify-environment.sh` names any missing tool; re-run
  `scripts/install-dependencies.sh` or install it manually, then retry.
- A bare `mvn` on `PATH` may be an unrelated tool. Set `RELICO_MAVEN` to the
  real Apache Maven binary if the environment check rejects it.
