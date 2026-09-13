"""
Tests for sensor I/O adaptation in the hardware-adapted LF.

Verifies:
- sensor helper functions exist in preamble
- sensor reactors use the helper functions
- hardcoded sensor values are removed
- formal artifact is unchanged
- JSON sensor examples can be parsed
- missing fields are handled
- boolean conversion logic is correct
- temperature threshold logic exists
"""

import os
import re
import hashlib
import json

# Paths
HARDWARE_LF = os.path.join(
    os.path.dirname(__file__), "..", "smarthome.lf"
)
FORMAL_LF = os.path.join(
    os.path.dirname(__file__), "..", "..", "generated", "TranslatedLFProgram.lf"
)

# Expected checksum for formal artifact
FORMAL_CHECKSUM = "e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9"


def read_file(path: str) -> str:
    with open(path, "r") as f:
        return f.read()


class TestSensorHelperFunctions:
    """Verify sensor helper functions exist in the LF preamble."""

    def test_read_sensor_temperature_exists(self):
        """read_sensor_temperature() helper function must exist."""
        content = read_file(HARDWARE_LF)
        assert "static int read_sensor_temperature()" in content, \
            "read_sensor_temperature() helper function not found"

    def test_read_sensor_light_exists(self):
        """read_sensor_light() helper function must exist."""
        content = read_file(HARDWARE_LF)
        assert "static bool read_sensor_light()" in content, \
            "read_sensor_light() helper function not found"

    def test_read_sensor_motion_exists(self):
        """read_sensor_motion() helper function must exist."""
        content = read_file(HARDWARE_LF)
        assert "static bool read_sensor_motion()" in content, \
            "read_sensor_motion() helper function not found"


class TestSensorReactorUsage:
    """Verify sensor reactors use the helper functions correctly."""

    def test_temp_sensor_uses_helper(self):
        """TempSensor must call read_sensor_temperature()."""
        content = read_file(HARDWARE_LF)
        assert "tempUpdateToRc.set(read_sensor_temperature())" in content, \
            "TempSensor does not use read_sensor_temperature()"

    def test_light_sensor_uses_helper(self):
        """LightSensor must call read_sensor_light()."""
        content = read_file(HARDWARE_LF)
        assert "lightUpdateToRc.set(read_sensor_light())" in content, \
            "LightSensor does not use read_sensor_light()"

    def test_motion_sensor_uses_helper(self):
        """MotionSensor must call read_sensor_motion()."""
        content = read_file(HARDWARE_LF)
        assert "read_sensor_motion()" in content, \
            "MotionSensor does not use read_sensor_motion()"


class TestHardcodedValuesRemoved:
    """Verify hardcoded sensor values are removed from the hardware LF."""

    def test_no_temp_update_hardcoded_value(self):
        """tempUpdateToRc.set(15) must not appear (hardcoded value removed)."""
        content = read_file(HARDWARE_LF)
        # The old hardcoded pattern should be gone
        assert "tempUpdateToRc.set(15)" not in content, \
            "Hardcoded temperature value 15 still present in tempUpdateToRc.set(15)"

    def test_no_light_update_hardcoded_value(self):
        """lightUpdateToRc.set(false) must not appear (hardcoded value removed)."""
        content = read_file(HARDWARE_LF)
        # The old hardcoded pattern should be gone
        assert "lightUpdateToRc.set(false)" not in content, \
            "Hardcoded light value 'false' still present"

    def test_motion_sensor_not_fixed(self):
        """MotionSensor should not have fixed true/false path."""
        content = read_file(HARDWARE_LF)
        # Should not have the old hardcoded pattern like motionDetectedToRc.set(1) or .set(0) with static value
        # The sensor should call the helper, not set a fixed value
        lines = content.split('\n')
        for line in lines:
            if 'motionDetectedToRc' in line and '.set(' in line:
                # It should be using read_sensor_motion(), not a hardcoded value
                assert 'read_sensor_motion()' in line or 'get()' in line, \
                    f"MotionSensor should use helper function, not hardcoded value: {line}"


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

    def test_formal_artifact_checksum(self):
        """TranslatedLFProgram.lf must match known checksum."""
        content = read_file(FORMAL_LF)
        actual_hash = hashlib.sha256(content.encode()).hexdigest()
        assert actual_hash == FORMAL_CHECKSUM, (
            f"Checksum mismatch for TranslatedLFProgram.lf: "
            f"expected {FORMAL_CHECKSUM}, got {actual_hash}"
        )

    def test_formal_artifact_no_sensor_helpers(self):
        """Formal artifact must not contain sensor helper functions."""
        content = read_file(FORMAL_LF)
        assert "read_sensor_temperature()" not in content, \
            "Formal artifact should not have sensor helpers"
        assert "read_sensor_light()" not in content, \
            "Formal artifact should not have sensor helpers"
        assert "read_sensor_motion()" not in content, \
            "Formal artifact should not have sensor helpers"


class TestJSONSensorParsing:
    """Verify JSON sensor data parsing logic is represented correctly."""

    def test_temperature_json_key(self):
        """Temperature helper looks for 'temp' key in JSON."""
        content = read_file(HARDWARE_LF)
        # Key is escaped as \\"temp\\": in C++ string literals
        assert '"temp":' in content or '\\"temp\\":' in content, \
            "Temperature helper does not look for 'temp' key"

    def test_light_json_key(self):
        """Light helper looks for 'light' key in JSON."""
        content = read_file(HARDWARE_LF)
        # Key is escaped as \\"light\\": in C++ string literals
        assert '"light":' in content or '\\"light\\":' in content, \
            "Light helper does not look for 'light' key"

    def test_motion_json_key(self):
        """Motion helper looks for 'motion' key in JSON."""
        content = read_file(HARDWARE_LF)
        # Key is escaped as \\"motion\\": in C++ string literals
        assert '"motion":' in content or '\\"motion\\":' in content, \
            "Motion helper does not look for 'motion' key"


class TestMissingFieldHandling:
    """Verify missing fields are handled correctly."""

    def test_temperature_missing_returns_zero(self):
        """Temperature helper returns 0 when field missing."""
        content = read_file(HARDWARE_LF)
        # Check the pattern: if key not found, return 0
        assert "return 0;" in content, \
            "Missing temperature should return 0"

    def test_light_missing_returns_false(self):
        """Light helper returns false when field missing."""
        content = read_file(HARDWARE_LF)
        # Check for false return in light function
        light_pattern = re.search(
            r'static bool read_sensor_light\([^)]*\)\s*{.*return false',
            content,
            re.DOTALL
        )
        assert light_pattern, \
            "Light helper should return false when field missing"

    def test_motion_missing_returns_false(self):
        """Motion helper returns false when field missing."""
        content = read_file(HARDWARE_LF)
        # Check for false return in motion function
        motion_pattern = re.search(
            r'static bool read_sensor_motion\([^)]*\)\s*{.*return false',
            content,
            re.DOTALL
        )
        assert motion_pattern, \
            "Motion helper should return false when field missing"


class TestBooleanConversion:
    """Verify boolean conversion logic is correct."""

    def test_light_boolean_conversion(self):
        """Light returns true when value > 0."""
        content = read_file(HARDWARE_LF)
        # Check: return std::atoi(...) > 0;
        assert "std::atoi(last.substr(s, e - s).c_str()) > 0" in content, \
            "Light boolean conversion should be: value > 0"

    def test_motion_boolean_conversion(self):
        """Motion returns true when value > 0."""
        content = read_file(HARDWARE_LF)
        # Check: return std::atoi(...) > 0;
        # The source file has escaped quotes, so use a simpler check
        motion_bool = re.search(
            r'read_sensor_motion.*?return\s+std::atoi.*?>\s*0;',
            content,
            re.DOTALL
        )
        assert motion_bool, \
            "Motion boolean conversion should be: value > 0"

    def test_temperature_uses_atoi(self):
        """Temperature uses atoi for integer conversion."""
        content = read_file(HARDWARE_LF)
        assert "std::atoi(last.substr(s, e - s).c_str())" in content, \
            "Temperature should use std::atoi for conversion"


class TestTemperatureThreshold:
    """Verify temperature threshold logic exists in RoomController."""

    def test_temp_threshold_below_20(self):
        """Temperature < 20 triggers something (heater on)."""
        content = read_file(HARDWARE_LF)
        assert "t < 20" in content, \
            "Temperature threshold < 20 not found"

    def test_temp_threshold_20_to_25(self):
        """Temperature 20-25 range handled."""
        content = read_file(HARDWARE_LF)
        assert "t <= 25" in content, \
            "Temperature threshold <= 25 not found"

    def test_temp_threshold_above_35(self):
        """Temperature > 35 triggers fire mode."""
        content = read_file(HARDWARE_LF)
        assert "t > 35" in content, \
            "Temperature threshold > 35 (fire) not found"


if __name__ == "__main__":
    import sys
    sys.exit(__import__('pytest').main([__file__, '-v']))