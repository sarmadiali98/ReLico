# External corpus validation

This directory holds the external corpus validation runs of the ReLico pipeline: the paper's own
evaluation corpus, translated and compiled as programs, separate from the application benchmark
suite under `benchmarks/`. These runs measure pipeline acceptance on unsolicited upstream models;
they are not included in the translator capability fixture or application benchmark counts.

Nothing here adds to the benchmark registry. The registry is an
infrastructure validation layer; this area exists to demonstrate
translation and compilation support for the real evaluation models
themselves. Property and specification files are out of scope.

## Structure

- `tier2/` contains 21 unmodified upstream models that passed the measured frontend screen. Twelve
  completed the recorded translation-to-runtime demonstration; the remaining nine expose documented
  translation or runtime boundaries. These runs are empirical pipeline evidence, not additional
  formal verification claims.
- `tier3/` — **relocated.** The paper-named case studies now live in the
  benchmark suite itself, as `general--<name>-case-study--positive` rows
  under `benchmarks/` with the full benchmark layout plus an
  `ADAPTATION.md` before/after record. First entry:
  `general--smarthome-case-study--positive`, the RQ2 ESP32 case study.

## Source provenance

The upstream models are not vendored in this repository. Each results row names its source, and
all sources and references are documented in
[`evaluation/registry/PROVENANCE.md`](../evaluation/registry/PROVENANCE.md): seventeen models are
adapted from LF Verifier Benchmarks (not used verbatim), sixteen come from the official Rebeca
examples at rebeca-lang.org, and sixteen are authored for this evaluation. Registered benchmark
directories contain committed source copies and provenance records; rerunning `examples/tier2`
additionally requires collecting the upstream models from those sources.

## Pipeline used

Identical to the benchmark pipeline and nothing else: the Java parser
bridge, the three `lean-export --family general` modes, `lfc 0.11.0` with
the C++ target, the generated binary, and -- as a recorded bonus, not a
gate -- the Rebeca model checker. See `tier2/RESULTS.tsv` for the column
meanings.

The non-gating RMC policy applies only to these unregistered demonstration runs. Registry-backed
translator fixtures and application benchmarks follow the mandatory stage policy in
[`evaluation/README.md`](../evaluation/README.md).
