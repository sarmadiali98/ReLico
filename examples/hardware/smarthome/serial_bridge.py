import serial
import json
import time
from collections import deque  # ring buffer [web:161]

PORT = '/dev/cu.usbserial-0001'
BAUD = 115200
OUTPUT_FILE = 'sensor_data.jsonl'  # one JSON per line
MAX_RECORDS = 100                  # keep at most 100

def main():
    print(f"Connecting to ESP32 on {PORT}...")
    ser = serial.Serial(PORT, BAUD, timeout=1)
    time.sleep(2)
    print("Connected! Reading sensor data...")
    print("Press Ctrl+C to stop\n")

    # Start with an empty file and empty buffer
    open(OUTPUT_FILE, 'w').close()
    buffer = deque(maxlen=MAX_RECORDS)

    while True:
        try:
            line = ser.readline().decode('utf-8').strip()
            if not line:
                continue

            if line.startswith('{'):
                data = json.loads(line)
                data['timestamp'] = time.time()

                # Add to ring buffer (drops oldest when > MAX_RECORDS)
                buffer.append(data)

                # Rewrite file with current buffer contents
                with open(OUTPUT_FILE, 'w') as f:
                    for record in buffer:
                        f.write(json.dumps(record) + '\n')

                latest = buffer[-1]
                print(
                    f"Count={len(buffer)} "
                    f"Temp={latest['temp']}°C, "
                    f"Humidity={latest['humidity']}%, "
                    f"Light={latest['light']}, "
                    f"Motion={latest['motion']}"
                )

        except json.JSONDecodeError:
            # Ignore malformed lines
            continue
        except KeyboardInterrupt:
            print("\nStopping serial bridge...")
            ser.close()
            break
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(1)

if __name__ == "__main__":
    main()
