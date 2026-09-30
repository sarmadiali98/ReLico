#!/usr/bin/env python3
"""
Transform ReLico-generated LF source into a verification-compatible form.

The ReLico translator emits ``target Cpp`` with an unnamed ``main reactor``. The
LF verifier (``lfc --verify``) requires ``target C`` and a named main reactor.
This script performs a deterministic, syntax-level transformation:

  1. Replace ``target Cpp`` with ``target C { fast: true }``.
  2. Name the main reactor by converting the benchmark ID to CamelCase.

The reaction bodies (inside ``{= ... =}``) are left untouched. ``target C`` in
lfc 0.11.0 code-gens against the reactor-c runtime, which accepts the same C++
statement forms the generator emits. ``@property`` annotations are injected by
``relico_property_mapper.py`` as a separate pass.

This is a **preparation** step only. It does not run the verifier.

Usage::

    python3 tools/relico_verifier_lf_prep.py \
        --benchmark-id general--pingpong-case-study--positive \
        --input GeneratedLFProgram.lf \
        --output VerifiedLFProgram.lf
"""

from __future__ import annotations

import argparse
import re
import sys

# Known suffixes to strip from benchmark IDs for name derivation.
# "case-study" is a documentation suffix, not part of the model identity.
_BENCHMARK_SUFFIX_PATS = [
    re.compile(r"-case-study$"),
]

# A direct lookup for benchmark IDs whose names don't CamelCase cleanly from
# their hyphen-separated form. Keys are the normalized name (family stripped,
# suffixes stripped, lowercase, hyphens removed). This avoids heuristic
# compound-word splitting for names like "pingpong" -> "PingPong".
_MAIN_REACTOR_NAME_OVERRIDES: dict[str, str] = {
    "pingpong": "PingPong",
    "aircraftdoor": "AircraftDoor",
    "safesend": "SafeSend",
    "unsafesend": "UnsafeSend",
    "traindoor": "TrainDoor",
    "traindoor2": "TrainDoor2",
    "traindoorfeedback": "TrainDoorFeedback",
    "checkpointbarrier2": "CheckpointBarrier2",
    "widebarrier24": "WideBarrier24",
    "traffictlight": "TrafficLight",
    "tcsma": "TCSMA",
    "tinyostdma": "TinyOSTDMA",
    "tinyosmacb": "TinyOSMACB",
    "leasingnrpfd": "LeasingNRPFD",
    "smarthome": "SmartHome",
    "autonomousvehicles": "AutonomousVehicles",
    "yarndeadlinefifo": "YarnDeadlineFifo",
    "yarndeadlinefifo1am": "YarnDeadlineFifo1AM",
    "yarndeadlinefifo2am": "YarnDeadlineFifo2AM",
    "yarndeadlinefifo3am": "YarnDeadlineFifo3AM",
    "yarndeadlinefifo4am": "YarnDeadlineFifo4AM",
    "processmsg": "ProcessMsg",
    "causalmsgsrvchain": "CausalMsgSrvChain",
    "circularmsgsrvordering": "CircularMsgSrvOrdering",
    "arbitrarymsgsrvordering": "ArbitraryMsgSrvOrdering",
    "partialmsgsrvordering": "PartialMsgSrvOrdering",
    "causalrebecchain": "CausalRebecChain",
    "circularrebecordering": "CircularRebecOrdering",
    "arbitraryrebecordering": "ArbitraryRebecOrdering",
    "partialrebecordering": "PartialRebecOrdering",
}

# All-caps acronym tokens.
_ALLCAPS_ACRONYMS = {
    "tcsma",
    "tdma",
    "macb",
    "nrpfd",
    "fifo",
}


def _strip_known_suffixes(name: str) -> str:
    """Strip documented suffix patterns that don't belong in a reactor name."""
    for pat in _BENCHMARK_SUFFIX_PATS:
        name = pat.sub("", name)
    return name


def _camel_case_word(word: str) -> str:
    """CamelCase a single lowercase word for use in a reactor name."""
    if not word:
        return ""
    if word.isdigit():
        return word
    if word[0].isdigit():
        # e.g., "1am" -> "1AM"
        if re.match(r"^[0-9]+[ap]m$", word):
            return word[0] + word[1:].upper()
        return word
    if word.lower() in _ALLCAPS_ACRONYMS:
        return word.upper()
    return word[0].upper() + word[1:]


def _normalize_benchmark_name(benchmark_id: str) -> str:
    """
    Extract the core model name from a benchmark ID.

    Strips the family prefix (``general--``), polarity suffix (``--positive`` /
    ``--negative``), and the ``-case-study`` documentation suffix.
    Returns a lowercase string with hyphens removed.
    """
    parts = benchmark_id.split("--")
    if len(parts) >= 3:
        middle = parts[1:-1]
    elif len(parts) == 2:
        middle = [parts[0]]
    else:
        middle = parts

    name = "-".join(middle)
    name = _strip_known_suffixes(name)
    # Remove remaining hyphens for lookup
    return name.replace("-", "").lower()


def benchmark_id_to_main_reactor_name(benchmark_id: str) -> str:
    """
    Derive a CamelCase main reactor name from a benchmark ID.

    The name should match the conventions used by the original hand-written LF
    verifier benchmarks so that UCLID variable references in property specs
    follow the ``{ModelName}_{instance}_{stateVar}`` pattern.

    Examples:
      general--pingpong-case-study--positive  ->  PingPong
      general--aircraftdoor-case-study--positive -> AircraftDoor
      general--checkpointbarrier2-case-study--positive -> CheckpointBarrier2
      general--factorial-case-study--positive -> Factorial
      general--periodic-fork-composition--positive -> PeriodicForkComposition
      general--smarthome-case-study--positive -> SmartHome
      general--leasingnrpfd-case-study--positive -> LeasingNRPFD
      general--tinyostdma-case-study--positive -> TinyOSTDMA
      general--traindoor2-case-study--positive -> TrainDoor2
      general--message-circulation--positive -> MessageCirculation
      general--causal-msgsrv-chain--positive -> CausalMsgSrvChain
      general--yarn-deadline-fifo-1am-case-study--positive -> YarnDeadlineFIFO1AM
    """
    normalized = _normalize_benchmark_name(benchmark_id)

    if normalized in _MAIN_REACTOR_NAME_OVERRIDES:
        base = _MAIN_REACTOR_NAME_OVERRIDES[normalized]
        # Handle "1am" suffix that was stripped during normalization
        # e.g., "yarndeadlinefifo1am" -> base "YarnDeadlineFIFO" + "1AM"
        # But our normalized key is "yarndeadlinefifo1am" which IS in the table.
        return base

    # Fall back to CamelCase heuristic from hyphen-separated words.
    name = "-".join(benchmark_id.split("--")[1:-1])
    name = _strip_known_suffixes(name)
    words = [w for w in name.split("-") if w]
    return "".join(_camel_case_word(w) for w in words)


def transform_lf_source(
    source: str,
    main_reactor_name: str,
) -> str:
    """
    Apply the deterministic transformation to LF source text.

    1. Replace ``target Cpp`` with ``target C { fast: true }``.
    2. Name the main reactor: ``main reactor {`` -> ``main reactor Name {``.
    """
    # Step 1: Target change.
    # The generated source starts with `target Cpp` on its own line.
    # We replace it with the C target + fast flag for verification.
    transformed = re.sub(
        r"^target\s+Cpp\b",
        "target C {\n    fast: true\n}",
        source,
        count=1,
        flags=re.MULTILINE,
    )

    # Step 2: Name the main reactor.
    # The generator emits `main reactor {` (unnamed).
    transformed = re.sub(
        r"main\s+reactor\s*\{",
        f"main reactor {main_reactor_name} {{",
        transformed,
        count=1,
    )

    return transformed


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="relico-verifier-lf-prep",
        description=(
            "Transform ReLico-generated LF (target Cpp, unnamed main) "
            "into verification-compatible LF (target C, named main)."
        ),
    )
    parser.add_argument(
        "--benchmark-id",
        required=True,
        help="ReLico benchmark ID, e.g. general--pingpong-case-study--positive",
    )
    parser.add_argument(
        "--input",
        required=True,
        help="Path to the generated LF source file (TranslatedLFProgram.lf)",
    )
    parser.add_argument(
        "--output",
        required=True,
        help="Path to write the verification-compatible LF source",
    )
    parser.add_argument(
        "--main-reactor-name",
        default=None,
        help=(
            "Override the derived main reactor name. "
            "By default derived from --benchmark-id."
        ),
    )

    args = parser.parse_args(argv)

    main_reactor_name = (
        args.main_reactor_name
        or benchmark_id_to_main_reactor_name(args.benchmark_id)
    )

    try:
        with open(args.input, encoding="utf-8") as f:
            source = f.read()
    except OSError as e:
        print(f"Error reading {args.input}: {e}", file=sys.stderr)
        return 1

    result = transform_lf_source(source, main_reactor_name)

    # Sanity checks: verify both transformations were applied.
    if re.match(r"^\s*target\s+Cpp\b", result, re.MULTILINE):
        print("Error: target Cpp was not replaced", file=sys.stderr)
        return 1

    if re.search(r"main\s+reactor\s*\{", result):
        print("Error: main reactor is still unnamed", file=sys.stderr)
        return 1

    with open(args.output, "w", encoding="utf-8") as f:
        f.write(result)

    print(
        f"VERIFIER_PREP_OK: wrote {args.output} "
        f"(main reactor: {main_reactor_name})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
