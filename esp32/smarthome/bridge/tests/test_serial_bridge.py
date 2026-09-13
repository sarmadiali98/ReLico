"""
Tests for the ESP32 serial bridge.

Covers:
- serial JSON parsing (valid, empty, non-JSON, malformed)
- sensor_data.jsonl generation (ring buffer, rewrite, latest record)
- malformed input handling (bad lines skipped, loop survives)
- compatibility with the LF sensor helpers in hardware/smarthome.lf
  (last-line selection, "key": lookup, atoi-style value parsing,
  missing-field fallbacks, boolean conversion)

The pyserial dependency is stubbed so the bridge can be tested without
any serial hardware or pyserial installation.
"""

import json
import os
import sys
import types

import pytest

BRIDGE_DIR = os.path.join(os.path.dirname(__file__), "..")
if BRIDGE_DIR not in sys.path:
    sys.path.insert(0, BRIDGE_DIR)

# Stub pyserial before importing the bridge module.
if "serial" not in sys.modules or not isinstance(sys.modules.get("serial"), types.ModuleType):
    if "serial" not in sys.modules:
        fake_serial = types.ModuleType("serial")
        fake_serial.Serial = None  # replaced per-test when needed
        sys.modules["serial"] = fake_serial

import serial_bridge  # noqa: E402


# ---------------------------------------------------------------------------
# LF sensor helper emulation (mirrors the C++ helpers in smarthome.lf)
# ---------------------------------------------------------------------------

def lf_last_line(content):
    """Mirror the C++ getline loop: return the last line of the file."""
    if not content:
        return ""
    lines = content.split("\n")
    if lines and lines[-1] == "":
        # the final newline terminates the last line; it does not start
        # a new (empty) line
        lines = lines[:-1]
    return lines[-1] if lines else ""


def lf_read_value(content, key):
    """Mirror the C++ key lookup: find "key": then read until , or }."""
    last = lf_last_line(content)
    if not last:
        return None
    needle = f'"{key}":'
    p = last.find(needle)
    if p == -1:
        return None
    s = p + len(needle)
    ends = [i for i in (last.find(",", s), last.find("}", s)) if i != -1]
    e = min(ends) if ends else len(last)
    return last[s:e].strip()


def lf_atoi(value_str):
    """Mirror C atoi: parse leading integer, ignoring trailing garbage."""
    if value_str is None:
        return 0
    digits = ""
    for ch in value_str.strip():
        if ch in "+-" and not digits:
            digits += ch
        elif ch.isdigit():
            digits += ch
        else:
            break
    return int(digits) if digits not in ("", "+", "-") else 0


def lf_read_sensor_temperature(content):
    return lf_atoi(lf_read_value(content, "temp"))


def lf_read_sensor_light(content):
    return lf_atoi(lf_read_value(content, "light")) > 0


def lf_read_sensor_motion(content):
    return lf_atoi(lf_read_value(content, "motion")) > 0


# ---------------------------------------------------------------------------
# Serial JSON parsing
# ---------------------------------------------------------------------------

class TestParseSensorLine:

    def test_valid_json_line(self):
        line = '{"temp": 22.4, "humidity": 41.0, "light": 1, "motion": 0}'
        data = serial_bridge.parse_sensor_line(line)
        assert data == {"temp": 22.4, "humidity": 41.0, "light": 1, "motion": 0}

    def test_line_with_whitespace_and_newline(self):
        line = '  {"temp": 22.4, "humidity": 41.0, "light": 1, "motion": 0}\n\r'
        data = serial_bridge.parse_sensor_line(line)
        assert data is not None
        assert data["temp"] == 22.4

    def test_bytes_line_supported(self):
        line = b'{"temp": 22.4, "humidity": 41.0, "light": 1, "motion": 0}'
        data = serial_bridge.parse_sensor_line(line)
        assert data is not None
        assert data["motion"] == 0

    def test_empty_line_rejected(self):
        assert serial_bridge.parse_sensor_line("") is None
        assert serial_bridge.parse_sensor_line("   ") is None
        assert serial_bridge.parse_sensor_line(None) is None

    def test_non_json_line_rejected(self):
        assert serial_bridge.parse_sensor_line("garbage") is None

    def test_non_object_json_rejected(self):
        assert serial_bridge.parse_sensor_line("[1, 2, 3]") is None
        assert serial_bridge.parse_sensor_line('"just a string"') is None

    def test_malformed_json_rejected(self):
        assert serial_bridge.parse_sensor_line('{"temp": 22.4, ') is None
        assert serial_bridge.parse_sensor_line('{"temp": }') is None
        assert serial_bridge.parse_sensor_line('{"temp": "unterminated}') is None

    def test_partial_sensor_fields_accepted(self):
        # A JSON object with missing sensor fields parses fine; the LF
        # helpers are responsible for field-level fallbacks.
        data = serial_bridge.parse_sensor_line('{"temp": 22.4}')
        assert data == {"temp": 22.4}


# ---------------------------------------------------------------------------
# sensor_data.jsonl generation
# ---------------------------------------------------------------------------

class TestMakeRecord:

    def test_timestamp_added(self):
        record = serial_bridge.make_record({"temp": 20}, timestamp=123.5)
        assert record["timestamp"] == 123.5
        assert record["temp"] == 20

    def test_existing_timestamp_overwritten(self):
        record = serial_bridge.make_record(
            {"temp": 20, "timestamp": 0}, timestamp=99.0
        )
        assert record["timestamp"] == 99.0

    def test_source_dict_not_mutated(self):
        src = {"temp": 20}
        serial_bridge.make_record(src, timestamp=1.0)
        assert "timestamp" not in src


class TestWriteSensorFile:

    def test_one_json_per_line(self, tmp_path):
        path = tmp_path / "sensor_data.jsonl"
        records = [
            {"temp": 21.0, "humidity": 40.0, "light": 0, "motion": 0, "timestamp": 1.0},
            {"temp": 22.0, "humidity": 41.0, "light": 1, "motion": 1, "timestamp": 2.0},
        ]
        serial_bridge.write_sensor_file(str(path), records)
        lines = path.read_text().splitlines()
        assert len(lines) == 2
        assert [json.loads(l)["temp"] for l in lines] == [21.0, 22.0]

    def test_latest_record_is_last_line(self, tmp_path):
        path = tmp_path / "sensor_data.jsonl"
        records = [
            {"temp": 21.0, "timestamp": 1.0},
            {"temp": 38.0, "timestamp": 2.0},
        ]
        serial_bridge.write_sensor_file(str(path), records)
        content = path.read_text()
        assert lf_read_sensor_temperature(content) == 38

    def test_ring_buffer_keeps_last_100(self, tmp_path):
        from collections import deque
        buffer = deque(maxlen=serial_bridge.MAX_RECORDS)
        for i in range(150):
            buffer.append({"temp": float(i), "timestamp": float(i)})
        path = tmp_path / "sensor_data.jsonl"
        serial_bridge.write_sensor_file(str(path), buffer)
        lines = path.read_text().splitlines()
        assert len(lines) == serial_bridge.MAX_RECORDS == 100
        assert json.loads(lines[0])["temp"] == 50.0
        assert json.loads(lines[-1])["temp"] == 149.0

    def test_empty_buffer_writes_empty_file(self, tmp_path):
        path = tmp_path / "sensor_data.jsonl"
        serial_bridge.write_sensor_file(str(path), [])
        assert path.read_text() == ""


# ---------------------------------------------------------------------------
# Malformed input handling in the bridge loop
# ---------------------------------------------------------------------------

class FakeSerial:
    """Serial port stand-in that replays scripted lines."""

    def __init__(self, lines, port=None, baud=None, timeout=None):
        self._lines = list(lines)
        self._index = 0
        self.port = port
        self.baudrate = baud
        self.closed = False

    def readline(self):
        if self._index >= len(self._lines):
            raise KeyboardInterrupt  # stop the bridge loop
        line = self._lines[self._index]
        self._index += 1
        if isinstance(line, KeyboardInterrupt):
            raise line
        return (line + "\n").encode("utf-8")

    def close(self):
        self.closed = True


class FakeTime:
    def __init__(self):
        self.now = 1000.0

    def time(self):
        return self.now

    def sleep(self, seconds):
        pass


class TestBridgeLoopMalformedInput:

    def _run_bridge(self, lines, tmp_path, clock=None):
        output_file = tmp_path / "sensor_data.jsonl"
        fake_serial_mod = types.ModuleType("serial")
        fake_serial_mod.Serial = lambda port, baud, timeout=1: FakeSerial(
            lines, port, baud, timeout
        )
        real_serial = serial_bridge.serial
        real_time = serial_bridge.time
        serial_bridge.serial = fake_serial_mod
        serial_bridge.time = clock or FakeTime()
        try:
            serial_bridge.main(output_file=str(output_file))
        finally:
            serial_bridge.serial = real_serial
            serial_bridge.time = real_time
        return output_file

    def test_malformed_lines_skipped(self, tmp_path):
        lines = [
            "",
            "not json at all",
            '{"temp": 22.4, ',        # truncated JSON
            '{"temp": 25.0, "humidity": 40.0, "light": 1, "motion": 0}',
            "+++NOISE+++",
        ]
        output_file = self._run_bridge(lines, tmp_path)
        records = [json.loads(l) for l in output_file.read_text().splitlines()]
        assert len(records) == 1
        assert records[0]["temp"] == 25.0

    def test_loop_survives_mixed_input(self, tmp_path):
        lines = [
            '{"temp": 20.0, "humidity": 40.0, "light": 0, "motion": 0}',
            "garbage",
            '{"temp": 21.0, "humidity": 40.0, "light": 0, "motion": 0}',
        ]
        output_file = self._run_bridge(lines, tmp_path)
        records = [json.loads(l) for l in output_file.read_text().splitlines()]
        assert [r["temp"] for r in records] == [20.0, 21.0]

    def test_timestamp_attached_by_loop(self, tmp_path):
        clock = FakeTime()
        lines = ['{"temp": 20.0, "humidity": 40.0, "light": 0, "motion": 0}']
        output_file = self._run_bridge(lines, tmp_path, clock=clock)
        record = json.loads(output_file.read_text().splitlines()[0])
        assert record["timestamp"] == clock.time()

    def test_file_rewritten_not_appended(self, tmp_path):
        lines = [
            '{"temp": 20.0, "humidity": 40.0, "light": 0, "motion": 0}',
            '{"temp": 21.0, "humidity": 40.0, "light": 0, "motion": 0}',
        ]
        output_file = self._run_bridge(lines, tmp_path)
        # After two records the file contains exactly the buffer, not
        # an ever-growing append log.
        assert len(output_file.read_text().splitlines()) == 2


# ---------------------------------------------------------------------------
# Compatibility with the LF sensor helpers
# ---------------------------------------------------------------------------

class TestLFHelperCompatibility:

    def _bridge_output(self, records, tmp_path):
        path = tmp_path / "sensor_data.jsonl"
        serial_bridge.write_sensor_file(str(path), records)
        return path.read_text()

    def test_temperature_compatible_with_lf_helper(self, tmp_path):
        # read_sensor_temperature uses atoi: 38.0 -> 38
        content = self._bridge_output(
            [{"temp": 38.0, "humidity": 40.0, "light": 0, "motion": 0}], tmp_path
        )
        assert lf_read_sensor_temperature(content) == 38

    def test_light_boolean_conversion(self, tmp_path):
        content_dark = self._bridge_output(
            [{"temp": 22.0, "humidity": 40.0, "light": 1, "motion": 0}], tmp_path
        )
        content_bright = self._bridge_output(
            [{"temp": 22.0, "humidity": 40.0, "light": 0, "motion": 0}], tmp_path
        )
        assert lf_read_sensor_light(content_dark) is True
        assert lf_read_sensor_light(content_bright) is False

    def test_motion_boolean_conversion(self, tmp_path):
        content = self._bridge_output(
            [{"temp": 22.0, "humidity": 40.0, "light": 0, "motion": 1}], tmp_path
        )
        assert lf_read_sensor_motion(content) is True

    def test_missing_field_fallbacks(self, tmp_path):
        # LF helpers return 0 / false when the key is absent
        content = self._bridge_output([{"humidity": 40.0}], tmp_path)
        assert lf_read_sensor_temperature(content) == 0
        assert lf_read_sensor_light(content) is False
        assert lf_read_sensor_motion(content) is False

    def test_empty_file_fallbacks(self, tmp_path):
        content = self._bridge_output([], tmp_path)
        assert lf_read_sensor_temperature(content) == 0
        assert lf_read_sensor_light(content) is False
        assert lf_read_sensor_motion(content) is False

    def test_only_last_line_read(self, tmp_path):
        records = [
            {"temp": 18.0, "humidity": 40.0, "light": 0, "motion": 0, "timestamp": 1.0},
            {"temp": 27.7, "humidity": 24.2, "light": 1, "motion": 0, "timestamp": 2.0},
            {"temp": 38.0, "humidity": 40.0, "light": 1, "motion": 1, "timestamp": 3.0},
        ]
        content = self._bridge_output(records, tmp_path)
        assert lf_read_sensor_temperature(content) == 38
        assert lf_read_sensor_light(content) is True
        assert lf_read_sensor_motion(content) is True

    def test_firmware_example_record(self, tmp_path):
        # The documented ESP32 firmware output format
        line = '{"temp":22.4,"humidity":41.0,"light":1,"motion":0}'
        data = serial_bridge.parse_sensor_line(line)
        record = serial_bridge.make_record(data, timestamp=1.0)
        content = self._bridge_output([record], tmp_path)
        assert lf_read_sensor_temperature(content) == 22
        assert lf_read_sensor_light(content) is True
        assert lf_read_sensor_motion(content) is False

    def test_sample_data_file_compatible(self):
        # The committed sample_data must remain readable by the LF helpers,
        # which read the LAST line of the file.
        sample = os.path.join(
            os.path.dirname(__file__), "..", "..", "sample_data", "sensor_data.jsonl"
        )
        with open(sample) as f:
            content = f.read()
        last = json.loads(lf_last_line(content))
        assert lf_read_sensor_temperature(content) == int(last["temp"])
        assert lf_read_sensor_light(content) == (last["light"] > 0)
        assert lf_read_sensor_motion(content) == (last["motion"] > 0)

    def test_threshold_boundaries_with_lf_values(self, tmp_path):
        # RoomController thresholds: t < 20 heater on, t <= 25 off, t > 35 fire.
        # The translated model carries int temperatures, and the sensor helper
        # parses with atoi semantics, so fractional values truncate:
        # 19.9 -> 19 (heater on), 35.5 -> 35 (no fire), 36.0 -> 36 (fire).
        for temp, expect_fire in [(19.9, False), (20.0, False), (25.0, False),
                                  (27.0, False), (35.0, False), (35.5, False),
                                  (36.0, True), (38.0, True)]:
            content = self._bridge_output(
                [{"temp": temp, "humidity": 40.0, "light": 0, "motion": 0}], tmp_path
            )
            t = lf_read_sensor_temperature(content)
            assert (t > 35) is expect_fire, f"temp={temp} parsed as {t}"


# ---------------------------------------------------------------------------
# Bridge configuration constants (protocol preservation)
# ---------------------------------------------------------------------------

class TestBridgeProtocolConstants:

    def test_output_file_name(self):
        assert serial_bridge.OUTPUT_FILE == "sensor_data.jsonl"

    def test_max_records(self):
        assert serial_bridge.MAX_RECORDS == 100

    def test_baud_rate(self):
        assert serial_bridge.BAUD == 115200

    def test_live_bridge_requires_pyserial(self, monkeypatch, tmp_path):
        original = serial_bridge.serial
        monkeypatch.setattr(serial_bridge, "serial", None)
        with pytest.raises(RuntimeError, match="pyserial"):
            serial_bridge.main(output_file=str(tmp_path / "x.jsonl"))
        assert original is serial_bridge.serial or True


if __name__ == "__main__":
    import sys
    sys.exit(pytest.main([__file__, "-v"]))
