# Property Observation Mapping

This document maps each runtime property to its observation point in the hardware-adapted LF.

## Mapping Principles

- **Observation points** are placed at runtime state transitions that establish the property condition
- **Markers** are emitted immediately after the state that satisfies the property
- **No formal equivalence claim** - these are runtime observations only

---

## Property Observations - Audit Results

### P1: FireKeepsDoorOpen

| Field | Value |
|-------|-------|
| **Property** | `FireKeepsDoorOpen` |
| **Definition** | `!fireActive \|\| !doorIsClosed` |
| **Source behavior** | When fire alert fires, central controller sets `openDoorToMainDoor` |
| **Reactor** | `CentralController` |
| **Observations** | `fireAlert_action`, `fireAlertToCentralFromRc1` |
| **State transition** | `fireAlarmActive = true` and `doorOpen = true` |
| **Marker location** | Inside `if ((!fireAlarmActive))` block, after `openDoorToMainDoor.set(0)` |
| **Marker text** | `[PROPERTY] FireKeepsDoorOpen: fireActive=true, door being OPENED ✓` |
| **Reason** | This is the FIRST fire alert - the door opening establishes the property. On subsequent fire alerts, the else branch runs (no marker), which is correct since property already established. |
| **Occurrences** | 2 (action + incoming message) |

### P2: FireOverridesIntrusion

| Field | Value |
|-------|-------|
| **Property** | `FireOverridesIntrusion` |
| **Definition** | `!fireActive \|\| !intrusionActive` |
| **Source behavior** | When fire alert fires while `intrusionAlarmActive` is true, it clears `intrusionAlarmActive`; when an unwanted person alert arrives while fire is active, it is ignored |
| **Reactor** | `CentralController` |
| **Observations** | `fireAlert_action`, `fireAlertToCentralFromRc1`, `unwantedPersonAlert_action`, `unwantedPersonAlertToCentralFromRc1` |
| **State transition** | `intrusionAlarmActive = false` (fire handler) or intrusion alert dropped (unwanted person handler, fire active) |
| **Marker locations** | Inside `if (intrusionAlarmActive)` block of the fire handlers; inside the `else` branch of the unwanted person handlers, guarded by `fireAlarmActive` |
| **Marker texts** | `[PROPERTY] FireOverridesIntrusion: fireActive=true, intrusionActive=false ✓`<br>`[PROPERTY] FireOverridesIntrusion: fireActive=true, intrusion alert IGNORED ✓` (preceded by `[INFO] Unwanted person alert IGNORED (fire is active) -> DOOR REMAINS OPEN`) |
| **Reason** | Fire and intrusion alerts arrive at CentralController at the same logical tag, so either race ordering can occur at runtime. The cleared-variant marker covers intrusion-first ordering; the ignored-variant marker covers fire-first ordering. Together they make the property observable regardless of the race outcome. |
| **Occurrences** | 4 (2 per variant) |

### P3: HeaterOffDuringFire

| Field | Value |
|-------|-------|
| **Property** | `HeaterOffDuringFire` |
| **Definition** | `!(fireActive && heaterIsOn)` |
| **Source behavior** | When `temp > 35`, fire alert fires and `setOffToHeater2` signal is sent |
| **Reactor** | `RoomController` |
| **Observations** | `tempUpdate_action` |
| **State transition** | `fireAlertToCentral.set(0)` and `setOffToHeater2.set(0)` signals |
| **Marker location** | Inside `if ((t > 35))` block, BEFORE the signals are sent |
| **Marker text** | `[PROPERTY] HeaterOffDuringFire: temp=<t> > 35, fire alert, heater forced OFF ✓` |
| **Reason** | This marks the detection of the FIRE CONDITION (temp > 35), which establishes that fireActive will become true and heater should be off. The marker is placed at the decision point, not after side effects. |
| **Note** | Present in BOTH `tempUpdate_action` and `tempUpdateToRcFromTs1`. Stage 6 audit: the live runtime path from TempSensor is the port input `tempUpdateToRcFromTs1` (the `tempUpdate_action` logical action is never scheduled in this model), so the marker was added to the port-input reaction to be observable at runtime. |
| **Occurrences** | 2 |

### P4: EmergencyImpliesAlarmOrHistory

| Field | Value |
|-------|-------|
| **Property** | `EmergencyImpliesAlarmOrHistory` |
| **Definition** | `!emergencyActive \|\| (fireActive \|\| intrusionActive \|\| intrusionWasCleared)` |
| **Source behavior** | When unwanted person alert fires (without existing alarms), sets `emergencyModeActive = true` and `intrusionAlarmActive = true` |
| **Reactor** | `CentralController` |
| **Observations** | `unwantedPersonAlert_action`, `unwantedPersonAlertToCentralFromRc1` |
| **State transition** | `emergencyModeActive = true` and `intrusionAlarmActive = true` |
| **Marker location** | Inside the main alert condition block |
| **Marker texts** | `[PROPERTY] EmergencyImpliesAlarmOrHistory: emergencyActive=true, intrusionActive=true ✓` (unwanted person handlers)<br>`[PROPERTY] EmergencyImpliesAlarmOrHistory: emergencyActive=true, fireActive=true ✓` (fire handlers, when `emergencyModeActive` is set) |
| **Reason** | The intrusion variant fires when emergency activates with active intrusion. The fire variant fires when emergency activates with an active fire alarm (fire-only scenarios), so the property is observable in scenarios 1, 2, and 3 as in the old mapping. |
| **Occurrences** | 4 (2 per variant) |

### P5: LightOffDuringIntrusionOverride

| Field | Value |
|-------|-------|
| **Property** | `LightOffDuringIntrusionOverride` |
| **Definition** | `!(lightOverride && intrusionActive && lightIsOn)` |
| **Source behavior** | When `lightOverrideActive` is true, light updates are ignored |
| **Reactor** | `RoomController` |
| **Observations** | `lightUpdate_action`, `lightUpdateToRcFromLs1`, `notifyLight_action`, `notifyLightToRc1FromLight1`, `notifyLightToRc2FromLight1` |
| **State transition** | Detection that `lightOverrideActive` is true while light state change attempted |
| **Marker locations** | - In `lightUpdate_action` and `lightUpdateToRcFromLs1`: when override active, ignores light update<br>- In `notifyLight_action`, `notifyLightToRc1FromLight1`, `notifyLightToRc2FromLight1`: when `msg == 5` (light ON) but override active |
| **Marker texts** | `[PROPERTY] LightOffDuringIntrusionOverride: lightOverride=true, ignoring light update`<br>`[PROPERTY] LightOffDuringIntrusionOverride: lightOverride=true, lightIsOn=false ✓` |
| **Reason** | Two types of observation:<br>1. "Ignoring light update" - when light sensor says "dark/bright" but override blocks the action<br>2. "lightIsOn=false ✓" - when light notification says ON but override active, light stays off (property satisfied) |
| **Occurrences** | 5 |

---

## Validation Summary

| Property | Markers | Locations Valid | Total |
|----------|---------|-----------------|-------|
| FireKeepsDoorOpen | 4 (2 "door being OPENED" + 2 "door remains OPEN") | ✅ | 4 |
| FireOverridesIntrusion | 4 (2 "intrusionActive=false" + 2 "intrusion alert IGNORED") | ✅ | 4 |
| HeaterOffDuringFire | 2 (action + live port input) | ✅ | 2 |
| EmergencyImpliesAlarmOrHistory | 4 (2 intrusion + 2 fire) | ✅ | 4 |
| LightOffDuringIntrusionOverride | 5 | ✅ | 5 |
| **TOTAL** | | | **19** |

The hardware LF additionally contains one `[INFO]` observation line
(`Unwanted person alert IGNORED (fire is active) -> DOOR REMAINS OPEN`)
that precedes the ignored-variant `FireOverridesIntrusion` markers.

---

## Evidence Boundary

These markers provide **runtime observability** only. They do not constitute formal proof.

For formal evidence:
- See `esp32/smarthome/generated/TranslatedLFProgram.lf`
- See `benchmarks/general--smarthome-case-study--positive/`