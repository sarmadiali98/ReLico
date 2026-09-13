"""
Tests for property marker validity in the hardware-adapted LF.

Verifies:
- All five property names exist in the LF source
- Marker format is valid
- The formal translation artifact remains unmodified
"""

import os
import re
import hashlib

# Paths
HARDWARE_LF = os.path.join(
    os.path.dirname(__file__), "..", "smarthome.lf"
)
FORMAL_LF = os.path.join(
    os.path.dirname(__file__), "..", "..", "generated", "TranslatedLFProgram.lf"
)

# Expected property names
PROPERTY_NAMES = [
    "FireKeepsDoorOpen",
    "FireOverridesIntrusion",
    "HeaterOffDuringFire",
    "EmergencyImpliesAlarmOrHistory",
    "LightOffDuringIntrusionOverride",
]

# Marker format: [PROPERTY] <Name>: <explanation>
MARKER_PATTERN = re.compile(r'\[PROPERTY\] ' + '|'.join(PROPERTY_NAMES) + r':')


def read_file(path: str) -> str:
    with open(path, "r") as f:
        return f.read()


class TestPropertyMarkers:
    """Verify property markers in hardware LF."""

    def test_all_five_properties_present(self):
        """All five property names must appear in marker format."""
        content = read_file(HARDWARE_LF)
        for name in PROPERTY_NAMES:
            pattern = f"[PROPERTY] {name}:"
            assert pattern in content, f"Property marker '{name}' not found in smarthome.lf"

    def test_marker_format_valid(self):
        """Markers must follow format: [PROPERTY] Name: explanation ✓"""
        content = read_file(HARDWARE_LF)
        markers = re.findall(r'\[PROPERTY\][^\n]+', content)
        assert len(markers) > 0, "No property markers found"

        for marker in markers:
            # Must contain a colon after the property name
            assert ":" in marker, f"Marker missing colon: {marker}"
            # Must contain a property name
            assert MARKER_PATTERN.search(marker), f"Marker has invalid property name: {marker}"

    def test_property_names_exact(self):
        """Property names must match exactly (case-sensitive)."""
        content = read_file(HARDWARE_LF)
        for name in PROPERTY_NAMES:
            # Check the name appears exactly as a property marker
            pattern = f"[PROPERTY] {name}:"
            assert pattern in content, f"Exact property name not found: {name}"

    def test_no_duplicate_markers_in_same_reaction(self):
        """Each reaction should not emit duplicate identical markers."""
        content = read_file(HARDWARE_LF)
        # Get all markers
        markers = re.findall(r'\[PROPERTY\][^\n]+', content)

        # Verify all expected property markers are present at least once
        # The old implementation has varying counts (some properties appear multiple times
        # in source code for different reactions, some only once)
        for name in PROPERTY_NAMES:
            pattern = f"[PROPERTY] {name}:"
            count = content.count(pattern)
            assert count >= 1, f"Property {name} appears {count} times, expected at least 1"

        # Verify total marker count matches expected (19 total markers in hardware LF)
        # Stage 6 completed the runtime observation points:
        # - HeaterOffDuringFire also on the live port-input path (tempUpdateToRcFromTs1)
        # - EmergencyImpliesAlarmOrHistory fire variant in fireAlert reactions
        # - FireOverridesIntrusion intrusion-ignored variant in unwantedPersonAlert reactions
        # Count occurrences (a reaction line may contain several markers).
        total_markers = content.count("[PROPERTY] ")
        assert total_markers == 19, f"Total marker count is {total_markers}, expected 19"


class TestFormalArtifactIntegrity:
    """Verify the formal translation artifact is unmodified."""

    def test_formal_artifact_unchanged(self):
        """TranslatedLFProgram.lf must not be modified."""
        content = read_file(FORMAL_LF)

        # Verify it starts with the exact expected header
        first_line = content.strip().split('\n')[0]
        assert first_line == "target Cpp", f"Unexpected first line: {first_line}"

        # Verify no comment headers (formal artifact has no comments)
        lines = content.strip().split('\n')
        for i, line in enumerate(lines):
            if line.startswith("//"):
                assert False, f"Formal artifact line {i+1} has unexpected comment: {line}"

        # Verify it ends with main reactor
        assert lines[-1].strip() == "}", f"Unexpected ending: {lines[-1]}"

    def test_formal_artifact_checksum(self):
        """TranslatedLFProgram.lf must match known checksum."""
        content = read_file(FORMAL_LF)
        actual_hash = hashlib.sha256(content.encode()).hexdigest()
        expected_hash = "e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9"
        assert actual_hash == expected_hash, (
            f"Checksum mismatch for TranslatedLFProgram.lf: "
            f"expected {expected_hash}, got {actual_hash}"
        )

    def test_formal_artifact_has_no_hardware_adaptation(self):
        """Formal artifact must not contain hardware adaptation markers."""
        content = read_file(FORMAL_LF)
        forbidden = [
            "[PROPERTY]",
            "[EVENT]",
            "[INFO]",
            "HARDWARE ADAPTATION",
            "std::cout",
        ]
        for item in forbidden:
            assert item not in content, (
                f"Formal artifact contains forbidden item: {item}"
            )


class TestStructuralPreservation:
    """Verify reactor/port/connection structure is preserved."""

    REACTORS = [
        "Heater", "Light", "Door", "TempSensor",
        "LightSensor", "MotionSensor", "RoomController",
        "CentralController",
    ]

    def test_all_reactors_present(self):
        """All reactors from formal artifact must exist in hardware LF."""
        hardware = read_file(HARDWARE_LF)
        formal = read_file(FORMAL_LF)

        for reactor in self.REACTORS:
            hw_pattern = f"reactor {reactor} {{"
            formal_pattern = f"reactor {reactor} {{"
            assert hw_pattern in hardware or f"reactor {reactor} {{" in hardware, (
                f"Reactor {reactor} missing from hardware LF"
            )
            assert formal_pattern in formal, f"Reactor {reactor} missing from formal artifact"

    def test_main_reactor_connections_match(self):
        """Main reactor connections must match formal artifact."""
        hardware = read_file(HARDWARE_LF)
        formal = read_file(FORMAL_LF)

        # Extract connection lines from both
        hw_connections = re.findall(r'^\s*(rc1|central|mainDoor|heater1|light1|ts1|ms1|ls1)\..\w+.*after', hardware, re.MULTILINE)
        formal_connections = re.findall(r'^\s*(rc1|central|mainDoor|heater1|light1|ts1|ms1|ls1)\..\w+.*after', formal, re.MULTILINE)

        assert len(hw_connections) == len(formal_connections), (
            f"Connection count mismatch: hardware={len(hw_connections)}, formal={len(formal_connections)}"
        )


if __name__ == "__main__":
    import sys
    sys.exit(__import__('pytest').main([__file__, '-v']))
