# ReLico

ReLico is an executable Lean 4 translation framework from a supported fragment of Deterministic Timed Rebeca (DTR) to a generated subset of Lingua Franca (LF) targeting C++.

## Overview

ReLico moves the DTR-to-LF translator into the Lean proof boundary. The same Lean definitions construct the target LF model and appear in structural and semantic correctness results. Parsing, interchange with the existing Timed Rebeca frontend, LF source generation, `lfc`, generated C++, and execution remain outside that proof boundary.

## Current Status

The active executable path is the **General family**. It supports multiple reactive classes and actor instances, known rebecs and external sends, typed message payloads and constructor arguments, integer and Boolean state, supported unary and binary expressions, assignments, conditionals, local declarations, and nonnegative constant send delays. Actor and message-server priorities are represented by generated reaction declaration order.

The General JSON decoder, elaborator, DTR-to-LF translation, LF printer, focused test catalog, source-to-runtime fixtures, and registry-backed evaluation infrastructure are implemented. Earlier singleton, finite-store, and multi-store families remain as compatibility and regression surfaces with family-specific theorem stacks.

The General semantic correspondence interface retains explicit run-level premises. The capability ledger maps declared fragment capabilities to executable or formal evidence. Parameterless externally routed messages remain intentionally refused, iteration and several wider Timed Rebeca constructs remain unsupported, and the stated proof boundaries and language limitations define the artifact scope.

## Architecture

```text
Timed Rebeca source
-> trusted parser, type checker, and JSON exporter
-> general-v1 JSON
-> Lean General decoder and elaborator
-> Lean DTR model
-> executable Lean DTR-to-LF translation
-> Lean LF model
-> trusted LF source printer
-> lfc 0.11.0 and generated C++
-> native execution
```

The legacy Java LF generator is not part of this path. See [Verification and trusted boundary](docs/trusted-boundary.md) for the exact boundary.

## Quick Start (Artifact Reviewers)

The recommended path is the **Docker image**: it already contains every tool,
each pinned to the exact version used to produce the reported results, so you do
not install or configure anything by hand. [`ARTIFACT.md`](ARTIFACT.md) has the
full walkthrough for both paths.

### Option A — Docker (recommended)

Docker runs the artifact inside a self-contained image, so you do **not** need to
install Lean, Java, Maven, `lfc`, or a C++ compiler on your own machine. Install
Docker once (see [Get Docker](https://docs.docker.com/get-docker/)), then run
four commands:

```bash
docker build -t relico .               # build the image (downloads + SHA-checks every tool)
docker run --rm -it relico             # open a shell inside the artifact
./smoke-test.sh                        # fast end-to-end check  -> "Artifact status: READY"
scripts/reproduce.sh --profile quick   # reproduce the evaluation -> "REPRODUCE_TEST=pass"
```

Every dependency is downloaded and verified **while the image is built**, so the
reviewer commands above run with no further downloads — and even work fully
offline (`docker run --network none ...`). The complete Docker walkthrough,
including offline execution and troubleshooting, is in
[`ARTIFACT.md`](ARTIFACT.md).

### Option B — native checkout

If you prefer to run directly on your machine, install the external toolchain
yourself and use the same reviewer scripts:

```bash
# 1. Verify the external toolchain (Java, Maven, lfc 0.11.0, a C++ compiler)
#    Install Java, Maven, and a C++ compiler yourself (system-wide).
#    scripts/install-dependencies.sh downloads and SHA-checks lfc, the RMC jar,
#    and the pinned parser archive into ~/.cache/relico (add --with-lfc for lfc).
scripts/install-dependencies.sh   # download lfc/RMC/parser archives
scripts/verify-environment.sh     # confirm all tools are visible

# 2. Fast end-to-end check: builds Lean, then analyzes, translates,
#    compiles, and runs a tiny bundled model. Prints "Artifact status: READY".
./smoke-test.sh

# 3. Analyze and run one of your own Timed Rebeca models
scripts/relico analyze path/to/model.rebeca
scripts/relico run     path/to/model.rebeca

# 4. Reproduce the reported evaluation (quick profile by default)
scripts/reproduce.sh
```

Every reviewer-facing script writes only under a temporary output directory and
changes nothing in the repository.

## Formal Verification

For each semantic family, Lean results apply to that family's declared syntax, semantics, translation, and hypotheses; a theorem from one family is not automatically a theorem about another.

For the active General family, Lean establishes structural properties of generated LF programs, preservation results for supported translation constructs, priority-order properties, source/target state correspondence, weak transfer results, and forward and backward observable-trace agreement through a named label-level weak-bisimulation interface. The correspondence is stated over a **partial within-tag quotient** and three of the interface's six fields retain explicit run-level premises. It is therefore not a premise-free proof of equivalence for the complete parser-to-runtime pipeline.

The precise claims, instruments, and residual premises are listed in [General-family correctness claims](docs/claims/general-family-correctness.md). Integration tests and benchmark runs provide empirical evidence across trusted components; they do not enlarge the Lean proof boundary.

## Supported Fragment

The authoritative accepted-fragment description is [The General Family's Accepted Fragment](docs/supported-fragment-general.md). In brief:

| Feature | Status | Restrictions / Notes |
|---|---|---|
| Classes and actors | Supported | Multiple classes and instances; names and bindings must satisfy the General well-formedness rules |
| State and values | Supported | `int` and `boolean` |
| Expressions | Supported | Literals, state/parameter/local reads, 13 binary and 2 unary operators |
| Statements | Supported | Assignment, send, conditional, and local declaration |
| Communication | Supported | Self sends and declared known-rebec sends with typed payloads and constant nonnegative delays |
| Priorities | Supported with theorem conditions | Translation preserves ordering; strict uniqueness results require distinctness hypotheses |
| Parameterless external sends | Partially supported | Intentionally refused until target-port behavior is established |
| Iteration | Unsupported | Rejected by the active frontend |
| Arrays, inheritance, environmental inputs, physical actions, broadcast | Unsupported | Outside the represented fragment |

The Lean General AST also contains an internal `trace` witness statement. It has no Timed Rebeca or `general-v1` frontend spelling and is not part of the accepted source-language fragment.

## Usage

### Reviewer workflow entry points

A reviewer who does not want to learn the internal repository layout can use the
location-independent wrappers. They discover the external tools the same way the
benchmarks do and honour the usual `RELICO_*` overrides.

```bash
./smoke-test.sh                       # fast six-gate end-to-end check
scripts/relico analyze model.rebeca   # accept model, report fragment + priorities
scripts/relico run     model.rebeca   # analyze + model-check + translate + compile + run
scripts/reproduce.sh                  # reproduce the evaluation (quick profile)
scripts/reproduce.sh --profile full   # complete evaluation
```

`scripts/relico analyze` parses and decodes only; `scripts/relico run` drives
the full verified pipeline and writes a machine-readable `report.json`. See the
[user workflow guide](examples/workflow/README.md) for example outputs, and
[`ARTIFACT.md`](ARTIFACT.md) for the complete reproduction walkthrough.

### Direct developer entry points

The Lean toolchain is pinned in `lean-toolchain`. Stable direct entry points
include:

```bash
lake build
tools/relico_test.sh --list
tools/relico_test.sh --tier unit
python3 tools/relico_bench.py --validate-registry
python3 tools/relico_bench.py --list
```

The active Lean APIs are `Relico.Frontend.decodeGeneralModelText` and `Relico.Translation.compileGeneralModel`. Source-to-runtime execution additionally requires separately installed external tools. The external parser-boundary test fetches and verifies the pinned public Rebeca compiler 2.25 source archive; `RELICO_PARSER_ARTIFACT` may name a digest-identical local archive for offline execution. The artifact reproduction workflow is provided through the documented build and evaluation entry points.

## Testing

The test system distinguishes logical software cases, aggregate Lean gates, translator fixtures, application benchmarks, and external prerequisites. The authoritative catalog is under `tests/catalog/`, translator fixtures are under `tests/translator/`, and unified test results are written under `.test-results/`. See [ReLico test system](tests/README.md) for tiers, selection, evidence classes, and counting rules.

## Evaluation

The registry-backed evaluation catalog reports five non-additive evidence populations: formal verification evidence, component correctness tests, 65 translator capability fixtures, 41 application benchmarks, and artifact validation, with the upstream corpus screen under `examples/` reported separately as external corpus validation. Every declared General-fragment capability has mapped evidence in the capability ledger, whose rows record any gap as `uncovered` rather than omitting it. Registry status and committed manifests describe what is currently implemented; the suite defines the artifact evaluation scope. See [ReLico executable evaluation catalog](evaluation/README.md) and [application benchmarks](benchmarks/README.md).

## Repository Structure

- `Relico/`: Lean source syntax, target syntax, translation, semantics, and correctness developments
- `frontend/`: trusted parser/export bridge, General schema, fixtures, and boundary checks
- `tests/`: authoritative test catalog and translator fixtures
- `benchmarks/`: application and source-evidence benchmarks
- `evaluation/`: shared benchmark registry and evaluation metadata
- `tools/`: catalog-backed test and benchmark interfaces
- `docs/`: scope, correctness claims, trusted boundary, and technical documentation
- `examples/`: unregistered empirical demonstration runs

## Documentation

- [Artifact quick start](ARTIFACT.md)
- [User workflow guide](examples/workflow/README.md)
- [Documentation index](docs/README.md)
- [Supported General fragment](docs/supported-fragment-general.md)
- [Verification and trusted boundary](docs/trusted-boundary.md)
- [General-family correctness claims](docs/claims/general-family-correctness.md)
- [Test and evidence model](tests/README.md)
- [Evaluation catalog](evaluation/README.md)
- [General frontend fixtures](frontend/fixtures/general/README.md)

## Limitations

- The upstream parser, type checker, JSON exporter, LF printer, `lfc`, generated C++, runtime, OS, and hardware are trusted rather than formally verified.
- General observable correspondence is conditional and uses a partial quotient, as recorded in the claim document.
- The accepted Timed Rebeca fragment assumes successful upstream parsing and type checking; arbitrary JSON accepted by the Lean decoder is not a substitute for that source-language judgment.
- Iteration, arrays, inheritance, environmental inputs, physical actions, and broadcast are not supported by the active translation path.
- External sends to parameterless message servers are refused.
- Benchmark coverage, evaluation methodology, and documentation are described by the included artifact materials.

## VMCAI 2027

ReLico is being prepared as the artifact associated with a VMCAI 2027 submission. The artifact includes the implementation, evaluation materials, and documentation required to reproduce the reported results.

## License

ReLico is licensed under the [MIT License](LICENSE). Third-party tools and dependencies retain their own license terms.
