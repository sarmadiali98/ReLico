# Verifier Benchmarks Migration Plan

## Goal

Import the legacy `verifier-benchmarks/` evaluation harness into this repository, make its TR/RMC and LF/UCLID5/Z3 smoke checks reproducible with the existing dependency and Docker workflows, and expose those checks through `scripts/reproduce.sh` as a separate stage.

Legacy source: `~/Desktop/ReLico-old-main.zip`, under `ReLico-old-main/verifier-benchmarks/`. Treat the archive as the migration source of truth; do not depend on a sibling old checkout being present for builds or runs.

## 1. Import and preserve the corpus

1. Extract the complete `verifier-benchmarks/` directory from the archive, preserving its relative paths and executable bits. Expected content includes:
   - `TR/src/` Timed Rebeca models and properties, `TR/tools/batch_rmc.py`, and `TR/sample_results.csv`.
   - `LF/benchmarks/src/` Lingua Franca models, `LF/scripts/run-benchmarks`, and `LF/results/result-2026-04-23-20-18-32.{csv,txt}`.
   - `scripts/check_env.sh`, `scripts/run_smoke.sh`, `scripts/run_tr_smoke.sh`, and `scripts/run_lf_smoke.sh`.
   - The legacy README and other tracked metadata needed by these runners.
2. Do not import generated build output, downloaded dependencies, or external verifier jars as source artifacts. In particular, `TR/tools/rmc-2.14.jar` is an external dependency and is not supplied by the archive; keep the committed sample results as historical reference data, not as freshly generated output.
3. Compare the extracted tree against the archive inventory and inspect `git diff --stat` plus executable modes. Verify that both source families, all four smoke/environment scripts, and all three sample result files are present. Preserve legacy results byte-for-byte unless a separately documented format migration is necessary.
4. Review the imported README against the actual scripts and this repository's install/reproduction commands. Replace old-repository assumptions and local install instructions with current ReLico paths, and explain that committed results are samples rather than proof that a local run succeeded.

## 2. Provision UCLID5 and Z3 consistently

The current `scripts/install-dependencies.sh` fetches RMC, the Rebeca parser, and optional `lfc`; it does not install UCLID5/Z3. The Dockerfile already has a separate UCLID5/Z3 build section. Extend the installer and reconcile Docker with that existing implementation rather than introducing a second set of pins.

1. Add an explicit verifier-toolchain option (for example `--with-verifiers`) to `scripts/install-dependencies.sh`. Reuse the Dockerfile's currently documented pins: Z3 4.8.8 and UCLID5 commit `4fd5e566c5f87b052f92e9b23723a85e1c4d8c1c`; retain the pinned sbt release and Java 17 requirement used to build UCLID5.
2. Install into the existing ReLico cache convention (or a clearly documented verifier subdirectory below it), make the UCLID5 and Z3 commands discoverable, and verify downloaded artifacts with recorded SHA-256 values. Ensure repeated installs are cache-aware and fail clearly on unsupported platforms or checksum mismatches.
3. Preserve the platform boundary: the current Z3 binary/native libraries are Linux x86_64-specific, even though the Java jar is architecture-neutral and the Dockerfile contains an arm64 build-host accommodation. Document which native host platforms the installer supports; do not imply Apple Silicon native support unless the selected Z3 distribution and UCLID5 JNI path are validated there.
4. Update `scripts/verify-environment.sh` so verifier tools can be checked for this stage (without making unrelated existing workflows require them if they remain optional). Update `DEPENDENCIES.md` and the verifier-benchmarks README with the option, versions, platform requirements, and setup behavior.
5. Update Docker to use the same pins and install behavior. The present Dockerfile already downloads Z3, installs sbt, builds UCLID5, sets `LD_LIBRARY_PATH`, and exposes `uclid`/`z3`; reconcile this with the installer so there is one authoritative version/checksum definition and Docker continues to build offline-ready runtime layers. Keep Java 17 available for the UCLID5 build, and validate `uclid --help` and `z3 --version` on the supported runtime architecture.

## 3. Keep external jars out of Docker context

Update `.dockerignore` to exclude externally downloaded verifier jars, including `verifier-benchmarks/TR/tools/*.jar` (or the narrowest equivalent pattern that covers the chosen cache/vendor location). Do not ignore the TR source, LF source, scripts, README, or committed sample result CSV/TXT files. Confirm Docker obtains RMC and verifier dependencies through the pinned install path, not through host-local files copied in the build context.

## 4. Add verifier smoke checks as reproduction Stage 5

Extend `scripts/reproduce.sh` with a new `run_stage_5` and stage name `verifier-benchmarks`; update stage-range validation, default stage selection, usage/comments, and the machine-readable summary consistently. Keep existing stage numbers and behavior unchanged.

1. Stage 5 should run the imported combined smoke entry point (`verifier-benchmarks/scripts/run_smoke.sh`), which covers both the TR/RMC and LF/UCLID5/Z3 representative cases. It should not run the full benchmark sweeps by default.
2. Capture output under `$RESULTS_DIR/verifier-benchmarks/` instead of replacing committed sample results. Record a stage pass/fail, print a useful failure tail and remediation hint, and ensure the top-level reproduction exit code and summary include Stage 5.
3. Add Stage 5 to the default stage list and permit direct selection with `--stage 5`. Decide and document whether the existing `quick` and `full` profiles both run the smoke checks (recommended); keep full corpus reruns as an explicit, separately documented command unless runtime is acceptable and results can be safely isolated.
4. Make sure the stage's environment gate uses installed tools and the cached RMC jar, rather than copying jars into the repository. Run scripts from a stable repository-relative working directory so their path assumptions work both on host and in Docker.
5. Update top-level artifact/reproduction documentation with the new stage, its dependencies, expected approximate runtime, and output location.

## 5. Validation and completion criteria

- The imported tree matches the legacy archive for source/scripts/sample results, with no external jar or generated output committed.
- `scripts/install-dependencies.sh --with-verifiers` is repeatable, verifies its pins, and leaves UCLID5/Z3 usable; `scripts/verify-environment.sh` reports missing verifier tools clearly.
- A clean Docker build provisions the verifier tools from the canonical pinned setup, excludes host jars from its context, and passes its verifier command checks.
- `scripts/reproduce.sh --stage 5 --results /tmp/relico-verifier-smoke` passes and writes fresh evidence only below that results directory; a deliberately missing verifier dependency fails with an actionable diagnostic.
- Existing `scripts/reproduce.sh --stage 0` through `--stage 4` behavior remains unchanged, and the default run's text/JSON summaries include stage 5.
- Documentation distinguishes the committed legacy sample results from output produced by the current smoke run.

## Suggested implementation order

1. Extract and audit the archive; adjust imported README paths and provenance notes.
2. Define the supported verifier-platform matrix and consolidate pins/checksum validation in the installer.
3. Align Docker and `.dockerignore` with that installer and test a clean image build.
4. Add Stage 5 and isolated result logging to `scripts/reproduce.sh`.
5. Update docs, then run the validation criteria above and record any platform-specific exclusions.