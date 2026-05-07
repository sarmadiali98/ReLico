#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT/TR"

echo "=== TR/RMC smoke test: AircraftDoor ==="

python3 tools/batch_rmc.py --only AircraftDoor

echo
echo "=== TR/RMC result CSV ==="
cat _cli_runs/results.csv
