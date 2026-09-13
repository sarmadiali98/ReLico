"""
Tests for the virtual hardware runner and scenario definitions.

Static tests verify:
- the runner exists and is executable
- all five documented scenarios are defined with the documented inputs
- the required property markers match the property-to-scenario mapping

Integration tests (skipped when the compiled LF binary is unavailable)
verify:
- every scenario executes and emits its required property markers
- baseline scenarios emit no property markers
- unknown scenarios are rejected

These are RUNTIME validation tests for the deployment artifact. They
are not a formal verification of the translated model.
"""

import os
import shutil
import subprocess
import sys

import pytest

SCENARIO_DIR = os.path.join(os.path.dirname(__file__), "..")
RUNNER = os.path.join(SCENARIO_DIR, "run_virtual_hardware.sh")
REPO_ROOT = os.path.join(SCENARIO_DIR, "..", "..", "..")
BINARY = os.path.join(REPO_ROOT, "bin", "smarthome")
HARDWARE_LF = os.path.join(REPO_ROOT, "esp32", "smarthome", "hardware", "smarthome.lf")

# Authoritative scenario table:
# name -> (temp, humidity, light, motion, required property markers)
EXPECTED_SCENARIOS = {
    "scenario-1-fire-emergency": (
        "38.0", "40.0", "0", "0",
        ["FireKeepsDoorOpen", "HeaterOffDuringFire",
         "EmergencyImpliesAlarmOrHistory"],
    ),
    "scenario-2-intrusion-stealth": (
        "24.0", "40.0", "1", "1",
        ["EmergencyImpliesAlarmOrHistory", "LightOffDuringIntrusionOverride"],
    ),
    "scenario-3-fire-overrides-intrusion": (
        "38.0", "40.0", "1", "1",
        ["FireKeepsDoorOpen", "FireOverridesIntrusion",
         "HeaterOffDuringFire", "EmergencyImpliesAlarmOrHistory"],
    ),
    "scenario-4-normal-baseline": (
        "27.0", "40.0", "0", "0",
        [],
    ),
    "scenario-5-cold-temperature": (
        "18.0", "40.0", "0", "0",
        [],
    ),
}

ALL_PROPERTIES = {
    "FireKeepsDoorOpen",
    "FireOverridesIntrusion",
    "HeaterOffDuringFire",
    "EmergencyImpliesAlarmOrHistory",
    "LightOffDuringIntrusionOverride",
}


def run_runner(args, env_overrides=None, timeout=120):
    env = dict(os.environ)
    if env_overrides:
        env.update(env_overrides)
    return subprocess.run(
        [RUNNER] + args,
        capture_output=True,
        text=True,
        env=env,
        timeout=timeout,
    )


def parse_list_output(text):
    """Parse the --list table into {name: (temp, hum, light, motion, [markers])}."""
    table = {}
    for line in text.splitlines():
        parts = line.split()
        if not parts or parts[0] in ("scenario", "---" + "-" * 20) or \
                not parts[0].startswith("scenario-"):
            continue
        name = parts[0]
        temp, hum, light, motion = parts[1], parts[2], parts[3], parts[4]
        rest = parts[5:]
        if rest and rest[0] == "(none":
            markers = []
        else:
            markers = rest
        table[name] = (temp, hum, light, motion, markers)
    return table


# ---------------------------------------------------------------------------
# Static scenario definition tests
# ---------------------------------------------------------------------------

class TestRunnerScript:

    def test_runner_exists_and_is_executable(self):
        assert os.path.isfile(RUNNER), f"runner missing: {RUNNER}"
        assert os.access(RUNNER, os.X_OK), "runner is not executable"

    def test_list_exits_zero(self):
        result = run_runner(["--list"])
        assert result.returncode == 0, result.stderr

    def test_all_five_scenarios_defined(self):
        result = run_runner(["--list"])
        table = parse_list_output(result.stdout)
        assert set(table.keys()) == set(EXPECTED_SCENARIOS.keys())

    def test_scenario_inputs_match_documentation(self):
        result = run_runner(["--list"])
        table = parse_list_output(result.stdout)
        for name, expected in EXPECTED_SCENARIOS.items():
            assert name in table, f"{name} missing from runner"
            got = table[name]
            assert got[:4] == expected[:4], (
                f"{name}: inputs {got[:4]} != documented {expected[:4]}"
            )

    def test_required_markers_match_property_mapping(self):
        result = run_runner(["--list"])
        table = parse_list_output(result.stdout)
        for name, expected in EXPECTED_SCENARIOS.items():
            got_markers = table[name][4]
            assert sorted(got_markers) == sorted(expected[4]), (
                f"{name}: required markers {got_markers} != {expected[4]}"
            )

    def test_every_property_used_in_some_scenario(self):
        used = set()
        for expected in EXPECTED_SCENARIOS.values():
            used.update(expected[4])
        assert used == ALL_PROPERTIES

    def test_unknown_scenario_rejected(self):
        result = run_runner(["scenario-does-not-exist"])
        assert result.returncode != 0
        assert "unknown scenario" in (result.stderr + result.stdout).lower()


# ---------------------------------------------------------------------------
# Integration tests (require the compiled LF binary)
# ---------------------------------------------------------------------------

def binary_available():
    if not (os.path.isfile(BINARY) and os.access(BINARY, os.X_OK)):
        return False
    if not os.path.isfile(HARDWARE_LF):
        return False
    # Skip if the binary predates the current LF source (stale build).
    return os.path.getmtime(BINARY) >= os.path.getmtime(HARDWARE_LF)


@pytest.mark.skipif(not binary_available(), reason="compiled LF binary not available")
class TestVirtualHardwareExecution:

    def _run(self, name, tmp_path):
        log_dir = tmp_path / "logs"
        result = run_runner(
            [name, "2"], env_overrides={"LOG_DIR": str(log_dir)}
        )
        assert result.returncode == 0, (
            f"{name} failed:\n{result.stdout}\n{result.stderr}"
        )
        log_file = log_dir / "hardware-scenarios" / f"{name}.log"
        assert log_file.is_file(), f"log not written: {log_file}"
        return log_file.read_text()

    def test_scenario_1_fire_emergency(self, tmp_path):
        content = self._run("scenario-1-fire-emergency", tmp_path)
        for marker in EXPECTED_SCENARIOS["scenario-1-fire-emergency"][4]:
            assert f"[PROPERTY] {marker}:" in content

    def test_scenario_2_intrusion_stealth(self, tmp_path):
        content = self._run("scenario-2-intrusion-stealth", tmp_path)
        for marker in EXPECTED_SCENARIOS["scenario-2-intrusion-stealth"][4]:
            assert f"[PROPERTY] {marker}:" in content

    def test_scenario_3_fire_overrides_intrusion(self, tmp_path):
        content = self._run("scenario-3-fire-overrides-intrusion", tmp_path)
        for marker in EXPECTED_SCENARIOS["scenario-3-fire-overrides-intrusion"][4]:
            assert f"[PROPERTY] {marker}:" in content

    def test_scenario_4_baseline_no_property_markers(self, tmp_path):
        content = self._run("scenario-4-normal-baseline", tmp_path)
        assert "[PROPERTY]" not in content

    def test_scenario_5_cold_no_property_markers(self, tmp_path):
        content = self._run("scenario-5-cold-temperature", tmp_path)
        assert "[PROPERTY]" not in content

    def test_marker_lines_well_formed(self, tmp_path):
        for name in EXPECTED_SCENARIOS:
            content = self._run(name, tmp_path)
            for line in content.splitlines():
                if line.startswith("["):
                    assert line.startswith(("[EVENT] ", "[INFO] ", "[PROPERTY] ")), (
                        f"malformed marker line in {name}: {line}"
                    )


if __name__ == "__main__":
    sys.exit(pytest.main([__file__, "-v"]))
