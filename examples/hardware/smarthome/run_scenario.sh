#!/usr/bin/env bash
set -euo pipefail

NAME="$1"
TEMP="$2"
HUMIDITY="$3"
LIGHT="$4"
MOTION="$5"
SECONDS_TO_RUN="${6:-6}"

OUTDIR="../../../artifact-env-info-macos/hardware-scenarios"
mkdir -p "$OUTDIR"

cat > sensor_data.jsonl <<EOF
{"temp": $TEMP, "humidity": $HUMIDITY, "light": $LIGHT, "motion": $MOTION, "timestamp": 0}
EOF

LOG="$OUTDIR/${NAME}.log"

./bin/smart_home > "$LOG" 2>&1 &
PID=$!
sleep "$SECONDS_TO_RUN"
kill "$PID" 2>/dev/null || true
wait "$PID" 2>/dev/null || true

echo "=== $NAME ==="
grep -E "\[EVENT\]|\[INFO\]|\[PROPERTY\]" "$LOG" | head -120 || true
echo
