#!/usr/bin/env python3
"""
Prepare a ReLico DTR benchmark for LF verifier execution (Stage 3).

This script is a single-entry preparation pipeline that transforms a ReLico
benchmark into a self-contained verification LF file, ready to be handed to
``lfc --verify`` (Stage 4). No verification is performed here.

Pipeline:

    DTR benchmark
        |
        |   --lf-input-->   Generated ReLico LF (target Cpp, unnamed main)
        v
    LF preparation (target C, named main reactor)
        |
        v
    DTR property file
        |
        v
    @property annotation (instance.variable -> Model_instance_variable)
        |
        v
    Inject @property before `main reactor` in LF source
        |
        v
    Final output directory:
        {main_reactor}.lf       (target C, named main, @property injected)
        property.txt           (the generated @property annotation text)
        metadata.json          (provenance, names, flags)

Reuses:
    - tools/relico_verifier_lf_prep.py   (transform_lf_source,
      benchmark_id_to_main_reactor_name)
    - tools/relico_property_mapper.py    (parse_dtr_property,
      generate_lf_property)

Usage::

    python3 tools/relico_prepare_verification_benchmark.py \\
        --benchmark-id general--aircraftdoor-case-study--positive \\
        --property-file property/aircraftdoor-door-monitor-no-violation.property \\
        --lf-input path/to/TranslatedLFProgram.lf \\
        --output-dir /tmp/aircraftdoor-verification
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

# Reuse existing infrastructure: import from sibling tools modules.
_tools_dir = Path(__file__).resolve().parent
if str(_tools_dir) not in sys.path:
    sys.path.insert(0, str(_tools_dir))

from relico_verifier_lf_prep import (  # noqa: E402
    benchmark_id_to_main_reactor_name,
    transform_lf_source,
)
from relico_property_mapper import (  # noqa: E402
    parse_dtr_property,
    generate_lf_property,
)


class PrepError(RuntimeError):
    """Raised when benchmark preparation fails."""


# ---------------------------------------------------------------------------
# @property injection
# ---------------------------------------------------------------------------

def inject_property_into_lf(
    lf_source: str,
    annotation: str,
) -> str:
    """
    Inject an @property annotation immediately before the ``main reactor``
    declaration in an LF source string.

    Per the LF verifier benchmark convention (see verifier-benchmarks/LF
    benchmarks in ReLico-old-main), the @property goes on the line(s) directly
    preceding ``main reactor Name {``.

    Raises PrepError if no ``main reactor`` declaration is found.
    """
    match = re.search(
        r"^main\s+reactor\b",
        lf_source,
        flags=re.MULTILINE,
    )
    if match is None:
        raise PrepError(
            "no 'main reactor' declaration found in LF source; "
            "cannot inject @property"
        )

    position = match.start()

    # Ensure the annotation ends with a newline so the main reactor line
    # starts on its own line.
    prefix = annotation.rstrip("\n") + "\n"

    # Ensure there's a blank line between the preceding content and the
    # @property annotation for readability (matching old benchmark style).
    before = lf_source[:position]
    if not before.endswith("\n\n"):
        # Normalize trailing whitespace before the annotation
        before = before.rstrip("\n") + "\n\n"

    return before + prefix + "\n" + lf_source[position:]


# ---------------------------------------------------------------------------
# Metadata
# ---------------------------------------------------------------------------

def build_metadata(
    *,
    benchmark_id: str,
    main_reactor: str,
    source_lf: str,
    verification_lf: str,
    property_file: str,
    prepared: bool,
) -> dict[str, object]:
    """Build the metadata.json content for the prepared benchmark."""
    return {
        "benchmark_id": benchmark_id,
        "main_reactor": main_reactor,
        "source_lf": source_lf,
        "verification_lf": verification_lf,
        "property": property_file,
        "prepared": prepared,
    }


# ---------------------------------------------------------------------------
# Main pipeline
# ---------------------------------------------------------------------------

def prepare_verification_benchmark(
    *,
    benchmark_id: str,
    property_file: Path,
    lf_input: Path,
    output_dir: Path,
    expected: str = "TRUE",
) -> dict[str, object]:
    """
    Run the full preparation pipeline and write outputs to output_dir.

    Returns the metadata dict.
    """
    # 1. Resolve the main reactor name from the benchmark ID.
    main_reactor_name = benchmark_id_to_main_reactor_name(benchmark_id)

    # 2. Read the generated LF source.
    if not lf_input.is_file():
        raise PrepError(f"LF input file not found: {lf_input}")

    lf_source_text = lf_input.read_text(encoding="utf-8")

    # 3. Transform LF: target Cpp -> C, name the main reactor.
    verification_lf_text = transform_lf_source(
        lf_source_text,
        main_reactor_name,
    )

    # 4. Parse the DTR property file and generate the @property annotation.
    if not property_file.is_file():
        raise PrepError(f"Property file not found: {property_file}")

    property_text = property_file.read_text(encoding="utf-8")

    try:
        dtr_prop = parse_dtr_property(property_text)
    except ValueError as error:
        raise PrepError(
            f"failed to parse property file {property_file}: {error}"
        ) from error

    dtr_prop.expected = expected
    annotation = generate_lf_property(dtr_prop, main_reactor_name)

    # 5. Inject @property before `main reactor` in the verification LF source.
    final_lf_text = inject_property_into_lf(verification_lf_text, annotation)

    # Sanity check: @property must be present and before main reactor.
    if "@property" not in final_lf_text:
        raise PrepError("@property annotation was not injected")
    if not re.search(r"^main\s+reactor\b", final_lf_text, flags=re.MULTILINE):
        raise PrepError("main reactor declaration is missing after injection")

    # Verify target C is present.
    if not re.search(r"^target\s+C\b", final_lf_text, re.MULTILINE):
        raise PrepError("target C was not applied during LF preparation")

    # Verify the main reactor is named (not just `main reactor {`).
    if re.search(r"main\s+reactor\s*\{", final_lf_text):
        raise PrepError(
            f"main reactor is still unnamed after preparation "
            f"(expected '{main_reactor_name}')"
        )

    # 6. Write outputs.
    output_dir.mkdir(parents=True, exist_ok=True)

    verification_lf_path = output_dir / f"{main_reactor_name}.lf"
    verification_lf_path.write_text(final_lf_text, encoding="utf-8")

    property_txt_path = output_dir / "property.txt"
    property_txt_path.write_text(annotation + "\n", encoding="utf-8")

    metadata = build_metadata(
        benchmark_id=benchmark_id,
        main_reactor=main_reactor_name,
        source_lf=str(lf_input),
        verification_lf=str(verification_lf_path),
        property_file=str(property_file),
        prepared=True,
    )

    metadata_path = output_dir / "metadata.json"
    metadata_path.write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )

    return metadata


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="relico-prepare-verification-benchmark",
        description=(
            "Prepare a ReLico DTR benchmark for LF verifier execution. "
            "Transforms generated LF (target Cpp, unnamed main) into "
            "verification LF (target C, named main reactor) with an "
            "@property annotation injected."
        ),
    )
    parser.add_argument(
        "--benchmark-id",
        required=True,
        help="ReLico benchmark ID, e.g. "
             "general--aircraftdoor-case-study--positive",
    )
    parser.add_argument(
        "--property-file",
        required=True,
        help="Path to the DTR .property file to convert and inject",
    )
    parser.add_argument(
        "--lf-input",
        required=True,
        help="Path to the generated LF source (TranslatedLFProgram.lf)",
    )
    parser.add_argument(
        "--output-dir",
        required=True,
        help="Directory to write {main_reactor}.lf, property.txt, "
             "and metadata.json",
    )
    parser.add_argument(
        "--expected",
        default="TRUE",
        choices=["TRUE", "FALSE"],
        help="Expected verification result for the property "
             "(default: TRUE)",
    )

    args = parser.parse_args(argv)

    property_path = Path(args.property_file)
    lf_path = Path(args.lf_input)
    output_path = Path(args.output_dir)

    try:
        metadata = prepare_verification_benchmark(
            benchmark_id=args.benchmark_id,
            property_file=property_path,
            lf_input=lf_path,
            output_dir=output_path,
            expected=args.expected,
        )
    except PrepError as error:
        print(f"relico-prepare: {error}", file=sys.stderr)
        return 1

    print(
        f"PREP_OK: prepared verification benchmark for {args.benchmark_id}"
    )
    print(f"  main_reactor: {metadata['main_reactor']}")
    print(f"  verification_lf: {metadata['verification_lf']}")
    print(f"  property.txt: {output_path / 'property.txt'}")
    print(f"  metadata.json: {output_path / 'metadata.json'}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
