# ESP32 Hardware Case Study Migration Mapping

This document captures the formal artifact boundary and migration strategy for the ReLico ESP32 hardware case study.

## A. Formal Artifact

### Source Model

| Item | Location |
|------|----------|
| Rebeca source | `esp32/smarthome/source/model.rebeca` |
| JSON representation | `esp32/smarthome/model.json` |

### Lean Translation Output

| Item | Location |
|------|----------|
| LF program | `esp32/smarthome/generated/TranslatedLFProgram.lf` |
| L4.6 checksum | `e011fc6701ff6c140b1b978c2ce49343983f2f84eddd217cf617fd8e0b462cd9` |
| Checksum match | ✅ Verified against `benchmarks/general--smarthome-case-study--positive/expected/lf-source/TranslatedLFProgram.lf` |

### Verification Boundary

The Lean translation artifact represents:

- **Verified translation correctness** from Timed Rebeca to Lingua Franca
- **Preservation of reactor structure** (Heater, Light, Door, TempSensor, LightSensor, MotionSensor, RoomController, CentralController)
- **Preservation of port semantics** and message passing
- **Preservation of timing behavior** via `after()` constructs
- **No hardware-specific modifications** - pure translation output

**Do not modify:** `esp32/smarthome/generated/TranslatedLFProgram.lf`

## B. Hardware Adaptation

### What Will Be Recreated

The hardware-adapted LF (`esp32/smarthome/hardware/smarthome.lf`) will be created from:

1. **Core reactor structure** - Copy from `TranslatedLFProgram.lf`:
   - Heater, Light, Door reactors (unchanged)
   - TempSensor, LightSensor, MotionSensor (source-reactive, will be adapted for ESP32 input)
   - RoomController, CentralController (unchanged)

2. **Main reactor connections** - Copy from `TranslatedLFProgram.lf`:
   - All inter-reactor connections preserved
   - All timing delays preserved

3. **Sensor interface layer**:
   - File-based sensor reading from `sensor_data.jsonl`
   - C++ preamble for `parse_sensor_value()` function

### What Is Reused

| Resource | Source | Purpose |
|----------|--------|---------|
| Protocol | `esp32-old/examples/hardware/smarthome/serial_bridge.py` | JSON serial bridge to ESP32 (refactored into testable functions in Stage 6, protocol unchanged) |
| Firmware | `esp32/smarthome/firmware/src/main.cpp` | ESP32 DHT22/LDR/PIR implementation |
| Scenario definitions | `esp32-old/examples/hardware/smarthome/README.md` + `logs/hardware-scenarios/` | Scenario names, inputs, property-to-scenario mapping |
| Evidence format | `esp32-old/examples/hardware/smarthome/logs/` | `[EVENT]`/`[INFO]`/`[PROPERTY]` marker convention, scenario log layout |

### What Is Intentionally NOT Reused

| Item | Reason |
|------|--------|
| `generated_smarthome.lf` (old generated LF) | Different translator output format (old Rebeca-to-LF) |
| Old `smarthome.lf` hardware LF | Incomplete/broken artifact from previous attempt |
| Hardcoded property emissions in reactors | Will be replaced by marker system |
| `platformio.ini` | Not part of LF source |

## C. Property Mapping

### Five Runtime Properties

| Property | old name | scenario triggering | expected observation | new hardware adaptation location |
|----------|----------|---------------------|----------------------|-----------------------------------|
| **P1** | `FireKeepsDoorOpen` | 1: Fire emergency (temp=38) | Door opens automatically when fire detected | `CentralController.fireAlert_action` → `reportToCentral2.set(0)` |
| **P2** | `FireOverridesIntrusion` | 3: Fire overrides intrusion (temp=38, motion=1) | Intrusion alarm cleared when fire alert precedes | `fireAlert_action` clears `intrusionAlarmActive` |
| **P3** | `HeaterOffDuringFire` | 1, 3: Fire scenarios | Heater turns OFF when temperature > 35°C | `tempUpdate_action` → `setOffToHeater3.set(0)` |
| **P4** | `EmergencyImpliesAlarmOrHistory` | 1, 2, 3: Any alarm scenario | `emergencyModeActive=true` always accompanied by active/cleared alarm | `setOnToLight2` reactions include `[PROPERTY]` markers |
| **P5** | `LightOffDuringIntrusionOverride` | 2: Intrusion stealth (motion=1) | Light remains OFF when override active during intrusion | `lightUpdate_action` and `notifyLight_action` include `[PROPERTY]` markers |

### Property Marker Format

```
[PROPERTY] <PropertyName>: <explanation> ✓
```

### Evidence Format

All scenarios produce logs containing:
- `[EVENT]` - State transitions (heater on/off, door open/close, light on/off)
- `[INFO]` - State evaluations (overrides, decisions)
- `[PROPERTY]` - Property-specific assertions with evidence

## D. Evidence Boundary

### Formal Translation Evidence (Lean Artifact)

**Provides:**
- Proof that every Lean DTR model translates to LF correctly
- Reactor name preservation
- Port connection preservation  
- Timing semantics preservation
- State and action mapping correctness

**Location:** `esp32/smarthome/generated/TranslatedLFProgram.lf`

### Runtime Validation Evidence (Hardware Execution)

**Provides:**
- Empirical validation that the translated LF executes correctly on target hardware
- Property satisfaction under real sensor inputs
- Scenario execution reproducibility

**Location:** 
- `esp32/smarthome/hardware/` - hardware adaptation LF
- `esp32/smarthome/logs/` - execution evidence
- `esp32/smarthome/scenario/` - test scenarios

### Hardware Adaptation Boundary

**Important:** The hardware adaptation LF (`esp32/smarthome/hardware/smarthome.lf`) is **NOT formally verified**. 

It provides:
- External sensor interface hooks
- File/serial I/O integration
- Observability instrumentation (property markers)

It must NOT claim:
- Formal semantic equivalence to the Lean artifact
- Provable property preservation through adaptation

### Paper Presentation

The paper should present:

1. **Formal evidence** (Section 4.1):
   - Lean translation correctness theorems
   - Checksum-verified artifact
   - Translation fidelity proof

2. **Empirical validation** (Section 4.2):
   - Hardware deployment layer description
   - Five property satisfaction evidence
   - Scenario execution logs

---

## Migration History

| Date | Stage | Change |
|------|-------|--------|
| 2026-09-13 | Stage 1 | Repository state audited, incomplete smarthome.lf removed |
| 2026-09-13 | Stage 2 | TranslatedLFProgram.lf verified against benchmark (checksum match) |
| 2026-09-13 | Stage 3 | Hardware LF skeleton created (483 lines, 8 reactors + main), compiles with lfc 0.11.0 |
| 2026-09-13 | Stage 4 | Property observation markers added (5 properties, 14 marker occurrences), test suite created |
| 2026-09-13 | Stage 5 | Sensor I/O adaptation: file-based sensor helpers replace hardcoded values, test suite extended (33 tests) |
| 2026-09-14 | Stage 6 | Virtual hardware execution validation: observation gaps fixed in deployment LF (19 marker occurrences), bridge refactored + 32 tests, `run_virtual_hardware.sh` runner with required-marker validation, all 5 scenarios executed and passing, 78 tests total, stale old-pipeline logs replaced with new-pipeline evidence |
| 2026-09-14 | Stage 7 | Evidence packaging and artifact hardening: README.md + ARTIFACT_REPRODUCTION.md + ARTIFACT_INVENTORY.md created, stray `logs\n` directory and stale `hardware/{include,lib,share,sensor_data.jsonl,smarthome_bin}` build residue removed, provenance headers added to scenario logs, all pipeline intermediates verified checksum-identical to benchmark expected artifacts, evidence regenerated |

## References

- Benchmark: `benchmarks/general--smarthome-case-study--positive/`
- Old workflow: `esp32-old/examples/hardware/smarthome/`
- Source: `esp32/smarthome/source/model.rebeca`
- Translation output: `esp32/smarthome/generated/TranslatedLFProgram.lf`
- Hardware adaptation: `esp32/smarthome/hardware/smarthome.lf`
- Property mapping: `esp32/smarthome/docs/PROPERTY_OBSERVATION_MAPPING.md`
- Test suite: `esp32/smarthome/hardware/tests/test_property_markers.py`