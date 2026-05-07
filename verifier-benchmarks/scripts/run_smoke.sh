#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

./scripts/check_env.sh
echo

./scripts/run_tr_smoke.sh
echo

./scripts/run_lf_smoke.sh
echo

echo "Verifier smoke tests completed."
