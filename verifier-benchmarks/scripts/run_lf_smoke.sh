#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT/LF"

echo "=== LF/Uclid/Z3 smoke test: AircraftDoor ==="

chmod +x scripts/run-benchmarks

rm -rf _smoke
mkdir -p _smoke/src
cp benchmarks/src/AircraftDoor.lf _smoke/src/AircraftDoor.lf

./scripts/run-benchmarks _smoke

latest_csv="$(ls -t results/result-*.csv | head -1)"
latest_txt="$(ls -t results/result-*.txt | head -1)"

echo
echo "=== LF smoke result CSV ==="
echo "$latest_csv"
cat "$latest_csv"

echo
echo "=== LF smoke result TXT ==="
echo "$latest_txt"
grep -E "AircraftDoor|Valid!|Not valid!|lfc_exit_code|uclid_exit_code|z3_exit_code|real" "$latest_txt" | head -80 || true
