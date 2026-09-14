# Measurement scripts behind the paper-corrections ledger

These three scripts produced the measured numbers cited in
the artifact documentation and measurement records.
They are included in the artifact so that reported measurements can be reproduced. They were
previously kept in gitignored `tmp/`, which meant a single `rm -rf tmp` would have left the ledger
citing evidence nobody could regenerate.

They are not part of the benchmark pipeline. Nothing in `tests/` invokes them, no manifest references
them, and they contribute no obligations. They are read-only analysis tools, run by hand when a claim
needs rechecking.

## The external input, and why it is not in the repo

Two of the three need the **upstream evaluation corpus**: the 49 upstream models recorded in
`evaluation/registry/general-corpus-selection.tsv` -- seventeen adapted from
lf-lang/lf-verifier-benchmarks (not used verbatim), sixteen from the official Rebeca examples at
rebeca-lang.org, and sixteen authored for this evaluation. Sources and references are documented
in `evaluation/registry/PROVENANCE.md`. The corpus is deliberately not vendored here; collect the
models into one directory and point the script at its root:

~~~text
python3 tools/paper-measurements/measure_priority_requirement.py /path/to/corpus
python3 tools/paper-measurements/census_topology_constructs.py /path/to/corpus
~~~

Both walk the tree for `*.rebeca` and parse the text lexically — no Java, no RMC, no network. The
expected model count is 49.

## What each one establishes

`measure_priority_requirement.py` compares two candidate scopes for the "absent `@priority` means
reject" rule over the 43 statically analysable models. It is the source of the 40/43 figure for the
blanket rule, the 9/43 figure for the contention-scoped rule, the finding that `KeepAlive ka` is never
a sender into a contended message server, and the finding that all three actor-priority tie models
have zero contended message servers. Those four numbers decided the frontend's well-formedness rules
and are quoted in ledger entries P4 and P5.

`census_topology_constructs.py` enumerates the constructs that defeat static topology resolution — the
A1 through A4 diagnostics — and identifies the five models that use them. It is the source of ledger
entry P6 and of the A1-A4 rejections the general exporter emits.

`lf_semantics_probe.sh` is different in kind: it must run on a machine with a real `lfc`, and it
compiles and executes small Lingua Franca programs to settle questions the LF documentation leaves
ambiguous. It established that `lfc 0.11.0` rejects `reaction(in[0])`, so multiports cannot carry the
§III-D fan-in construction and named ports are forced; that reaction declaration order does decide
same-tag order within one reactor; and that unconnected input ports are legal. Ledger entries P1, P2
and P3 rest on it. It was last run against `lfc 0.11.0` on 2026-08-25, and its conclusions should be
re-established rather than assumed if the toolchain version moves.

One caveat belongs here rather than only in the findings file, because it applies to how every result in
this script should be read. Most probes observe behaviour by calling `std::printf` from a reaction body,
which is a channel LF does not model: the language fixes port values and reactor state at a tag, not the
interleaving of raw target-language statements. Where a probe's question is "does this compile" or "does
this value survive", that does not matter. Where the question is about **order**, it matters entirely —
such a probe measures `reactor-cpp` at one version, not the language, and cannot license a theorem. See
**F77** in the design documentation, which was written after
section 16 produced nine order measurements of which exactly one is citable. The rule it lands on: name
the construct of the specification the observed quantity is meant to follow from, before reading the
output.
