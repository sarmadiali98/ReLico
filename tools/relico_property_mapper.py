#!/usr/bin/env python3
"""
Map ReLico DTR property files to LF @property annotations.

The DTR property format (used by the benchmark harness) uses ``instance.variable``
references and a ``property { define { ... } Assertion { ... } }`` structure.
The LF verifier's ``@property`` annotation expects fully qualified names of the
form ``{ModelName}_{instance}_{stateVariable}`` and an MTL/SMT formula string.

This script performs the deterministic conversion:

1. Parse the DTR property file to extract the formula definition and the
   assertion name.
2. Resolve reactor instance variable references from ``instance.variable``
   to ``{ModelName}_{instance}_{variable}``.
3. Emit an LF ``@property`` annotation with the resolved formula.

The model name is derived from the benchmark ID via the same
``benchmark_id_to_main_reactor_name`` function used by
``relico_verifier_lf_prep.py``, ensuring consistency with the LF source's
main reactor name.

Usage::

    python3 tools/relico_property_mapper.py \
        --benchmark-id general--aircraftdoor-case-study--positive \
        --input property/aircraftdoor-door-monitor-no-violation.property \
        --output property/generated/AircraftDoor_NoMonitorViolation.property
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass, field

# Reuse the benchmark ID -> reactor name mapping from the LF verifier prep module.
# We import it to avoid duplicating the override table.
import os
_tools_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, _tools_dir)
from relico_verifier_lf_prep import benchmark_id_to_main_reactor_name  # noqa: E402


# ---------------------------------------------------------------------------
# DTR property file parser
# ---------------------------------------------------------------------------

# Matches a DTR property reference: lowercase identifier followed by '.' and
# another identifier (e.g., "coord.epoch", "rm.m_queue_misses", "door.doorOpen").
# Instance names are lowercase identifiers; variable names may contain
# alphanumeric and underscores (matching LF state variable names).
_PROPERTY_REF_RE = re.compile(
    r"\b([a-z][a-z0-9_]*)\.([A-Za-z_][A-Za-z0-9_]*)\b"
)

# Matches the property block structure.
_PROPERTY_HEADER_RE = re.compile(
    r"^\s*property\s*\{", re.MULTILINE
)

# Matches: FormulaName = <formula>;
_FORMULA_RE = re.compile(
    r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*(.+?);",
    re.MULTILINE | re.DOTALL,
)

# Matches: ModelName_FormulaName : FormulaName;
_ASSERTION_RE = re.compile(
    r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*:\s*([A-Za-z_][A-Za-z0-9_]*)\s*;",
    re.MULTILINE,
)


@dataclass
class DtrProperty:
    """A parsed DTR property file."""
    formula_name: str = ""
    formula_body: str = ""
    assertion_name: str = ""
    # Map of formula_name -> formula body for define block (usually one).
    defines: dict[str, str] = field(default_factory=dict)
    expected: str = "TRUE"
    logic: str = "Assertion"


def strip_comments(text: str) -> str:
    """Strip /* */ and // comments from property file text."""
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)
    return re.sub(r"//[^\n]*", "", text)


def parse_dtr_property(text: str) -> DtrProperty:
    """
    Parse a DTR .property file into a DtrProperty.

    Expected format:

        property {
            define {
                FormulaName = (instance.variable == value);
            }
            Assertion {
                ModelName_FormulaName : FormulaName;
            }
        }

    Returns the first formula and assertion found.
    """
    cleaned = strip_comments(text).strip()

    prop = DtrProperty()

    # Find the property block.
    header_match = _PROPERTY_HEADER_RE.match(cleaned)
    if header_match is None:
        raise ValueError("missing 'property {' header in .property file")

    # Extract the body of the property block (between the outer braces).
    body_start = header_match.end()
    depth = 1
    body_end = body_start
    for i in range(body_start, len(cleaned)):
        if cleaned[i] == "{":
            depth += 1
        elif cleaned[i] == "}":
            depth -= 1
            if depth == 0:
                body_end = i
                break
    else:
        raise ValueError("unmatched braces in property file")

    body = cleaned[body_start:body_end]

    # Parse the define block.
    define_re = re.compile(
        r"define\s*\{(.*?)\}", re.DOTALL | re.IGNORECASE
    )
    define_match = define_re.search(body)
    if define_match:
        define_body = define_match.group(1)
        for formula_match in _FORMULA_RE.finditer(define_body):
            name = formula_match.group(1)
            formula = formula_match.group(2).strip()
            prop.defines[name] = formula
        if prop.defines:
            prop.formula_name = next(iter(prop.defines))
            prop.formula_body = prop.defines[prop.formula_name]

    # Parse the Assertion block.
    assertion_re = re.compile(
        r"Assertion\s*\{(.*?)\}", re.DOTALL | re.IGNORECASE
    )
    assertion_match = assertion_re.search(body)
    if assertion_match:
        assertion_body = assertion_match.group(1)
        for am in _ASSERTION_RE.finditer(assertion_body):
            prop.assertion_name = am.group(1)
            # The formula_name referenced in the assertion (not currently
            # used for output, but validated for completeness).
            _ = am.group(2)

    if not prop.assertion_name:
        raise ValueError("no Assertion declaration found in property file")

    if not prop.formula_name:
        raise ValueError("no define formula found in property file")

    return prop


# ---------------------------------------------------------------------------
# Variable reference resolution
# ---------------------------------------------------------------------------

def resolve_instance_variable(
    model_name: str,
    match: re.Match,
) -> str:
    """
    Convert a DTR ``instance.variable`` reference to the LF verifier's
    fully qualified name ``{ModelName}_{instance}_{variable}``.
    """
    instance = match.group(1)
    variable = match.group(2)
    return f"{model_name}_{instance}_{variable}"


def resolve_formula(
    model_name: str,
    formula: str,
) -> str:
    """
    Replace all ``instance.variable`` references in a formula with
    ``Model_instance_variable`` qualified names.
    """
    return _PROPERTY_REF_RE.sub(
        lambda m: resolve_instance_variable(model_name, m),
        formula,
    )


# ---------------------------------------------------------------------------
# LF @property annotation generation
# ---------------------------------------------------------------------------

def generate_lf_property(dtr_prop: DtrProperty, model_name: str) -> str:
    """
    Generate an LF @property annotation from a parsed DTR property.

    Output format:

        @property(name="assertion_name", tactic="bmc", spec="resolved_formula", expect=true/false)
    """
    resolved_formula = resolve_formula(model_name, dtr_prop.formula_body)
    expect = "true" if dtr_prop.expected.upper() == "TRUE" else "false"

    return (
        f'@property(name="{dtr_prop.assertion_name}", '
        f'tactic="bmc", '
        f'spec="{resolved_formula}", '
        f'expect={expect})'
    )


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="relico-property-mapper",
        description=(
            "Convert a ReLico DTR .property file into an LF @property "
            "annotation, resolving instance.variable references to "
            "Model_instance_variable fully qualified names."
        ),
    )
    parser.add_argument(
        "--benchmark-id",
        required=True,
        help="ReLico benchmark ID, e.g. general--aircraftdoor-case-study--positive",
    )
    parser.add_argument(
        "--input",
        required=True,
        help="Path to the DTR .property file",
    )
    parser.add_argument(
        "--output",
        default=None,
        help="Path to write the generated @property annotation (required unless --print)",
    )
    parser.add_argument(
        "--expected",
        default="TRUE",
        choices=["TRUE", "FALSE"],
        help="Expected verification result for the property",
    )
    parser.add_argument(
        "--print",
        action="store_true",
        help="Print the generated annotation to stdout instead of writing to a file",
    )

    args = parser.parse_args(argv)

    model_name = benchmark_id_to_main_reactor_name(args.benchmark_id)

    try:
        with open(args.input, encoding="utf-8") as f:
            source = f.read()
    except OSError as e:
        print(f"Error reading {args.input}: {e}", file=sys.stderr)
        return 1

    try:
        dtr_prop = parse_dtr_property(source)
    except ValueError as e:
        print(f"Error parsing {args.input}: {e}", file=sys.stderr)
        return 1

    dtr_prop.expected = args.expected
    annotation = generate_lf_property(dtr_prop, model_name)

    if not args.print and not args.output:
        parser.error("--output is required unless --print is used")

    if args.print:
        print(annotation)
    else:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(annotation + "\n")
        print(
            f"PROPERTY_OK: wrote {args.output} "
            f"(assertion: {dtr_prop.assertion_name}, "
            f"model: {model_name})"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
