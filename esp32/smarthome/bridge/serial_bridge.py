"""Serial bridge for the ESP32 smart-home deployment.

Reads JSON sensor records from the ESP32 over serial and continuously
rewrites ``sensor_data.jsonl`` with the most recent records (one JSON
object per line), which is the file interface consumed by the sensor
helpers in ``esp32/smarthome/hardware/smarthome.lf``.

Bridge protocol (unchanged from the original ESP32 workflow):

- one JSON object per serial line, starting with ``{``
- sensor fields: ``temp``, ``humidity``, ``light``, ``motion``
- a ``timestamp`` field is attached to every stored record
- malformed lines are skipped
- at most ``MAX_RECORDS`` records are retained (ring buffer)
"""

import json
import time
from collections import deque

try:
    import serial
except ImportError:  # pyserial only needed for the live bridge, not for tests
    serial = None

PORT = '/dev/cu.usbserial-0001'
BAUD = 115200
OUTPUT_FILE = 'sensor_data.jsonl'  # one JSON per line
MAX_RECORDS = 100                  # keep at most 100


def parse_sensor_line(line):
    """Parse one serial line into a sensor record dict.

    Returns None for empty lines, non-JSON lines, or malformed JSON,
    mirroring the original bridge behavior of ignoring bad input.
    """
    if line is None:
        return None
    if isinstance(line, bytes):
        line = line.decode('utf-8', errors='replace')
    line = line.strip()
    if not line or not line.startswith('{'):
        return None
    try:
        data = json.loads(line)
    except (json.JSONDecodeError, ValueError):
        return None
    if not isinstance(data, dict):
        return None
    return data


def make_record(data, timestamp=None):
    """Return a copy of ``data`` with a ``timestamp`` attached."""
    record = dict(data)
    record['timestamp'] = time.time() if timestamp is None else timestamp
    return record


def write_sensor_file(path, records):
    """Rewrite the sensor file with the current buffer contents."""
    with open(path, 'w') as f:
        for record in records:
            f.write(json.dumps(record) + '\n')


def format_latest(latest, count):
    """Human-readable one-line summary of the latest reading."""
    return (
        f"Count={count} "
        f"Temp={latest['temp']}°C, "
        f"Humidity={latest['humidity']}%, "
        f"Light={latest['light']}, "
        f"Motion={latest['motion']}"
    )


def main(port=PORT, baud=BAUD, output_file=OUTPUT_FILE):
    """Run the live serial bridge loop."""
    if serial is None:
        raise RuntimeError(
            "pyserial is required for the live bridge: "
            "python3 -m pip install pyserial"
        )

    print(f"Connecting to ESP32 on {port}...")
    ser = serial.Serial(port, baud, timeout=1)
    time.sleep(2)
    print("Connected! Reading sensor data...")
    print("Press Ctrl+C to stop\n")

    # Start with an empty file and empty buffer
    open(output_file, 'w').close()
    buffer = deque(maxlen=MAX_RECORDS)

    while True:
        try:
            line = ser.readline()
            data = parse_sensor_line(line)
            if data is None:
                continue

            # Add to ring buffer (drops oldest when > MAX_RECORDS)
            buffer.append(make_record(data))

            # Rewrite file with current buffer contents
            write_sensor_file(output_file, buffer)

            print(format_latest(buffer[-1], len(buffer)))

        except KeyboardInterrupt:
            print("\nStopping serial bridge...")
            ser.close()
            break
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(1)


if __name__ == '__main__':
    main()
