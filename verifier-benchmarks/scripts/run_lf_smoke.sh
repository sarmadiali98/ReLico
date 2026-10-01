#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT/LF"

echo "=== LF/Uclid/Z3 smoke test: AircraftDoor ==="

chmod +x scripts/run-benchmarks

rm -rf _smoke
mkdir -p _smoke/src
cp benchmarks/src/AircraftDoor.lf _smoke/src/AircraftDoor.lf

tmp_output="$(mktemp)"

./scripts/run-benchmarks _smoke 2>&1 | tee "$tmp_output"

new_txt="$(grep -E '/result-[0-9-]+-[0-9-]+\.txt$' "$tmp_output" | tail -1)"
new_csv="$(grep -E '/result-[0-9-]+-[0-9-]+\.csv$' "$tmp_output" | tail -1)"

rm -f "$tmp_output"

if [[ -z "${new_txt:-}" || -z "${new_csv:-}" ]]; then
  echo "ERROR: could not identify result files produced by run-benchmarks."
  exit 1
fi

# Convert absolute paths to paths relative to verifier-benchmarks/LF when possible.
if [[ "$new_txt" == "$PWD/"* ]]; then
  new_txt="${new_txt#$PWD/}"
fi

if [[ "$new_csv" == "$PWD/"* ]]; then
  new_csv="${new_csv#$PWD/}"
fi

echo
echo "=== LF smoke result CSV ==="
echo "$new_csv"
cat "$new_csv"

echo
echo "=== LF smoke result TXT ==="
echo "$new_txt"
grep -E "AircraftDoor|Valid!|Not valid!|lfc_exit_code|uclid_exit_code|z3_exit_code|real" "$new_txt" | head -120 || true

echo
echo "LF/Uclid/Z3 smoke test completed."
