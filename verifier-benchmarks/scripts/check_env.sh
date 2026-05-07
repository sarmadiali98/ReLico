#!/usr/bin/env bash
set -u

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "=== ReLico verifier environment check ==="
echo

missing=0

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[OK] $cmd -> $(command -v "$cmd")"
  else
    echo "[MISSING] $cmd"
    missing=1
  fi
}

echo "=== Required commands ==="
check_cmd java
check_cmd javac
check_cmd python3
check_cmd c++
check_cmd lfc
check_cmd uclid
check_cmd z3
echo

echo "=== Versions / tool info ==="
java -version 2>&1 || true
echo
javac -version 2>&1 || true
echo
python3 --version 2>&1 || true
echo
lfc --version 2>&1 || true
echo
echo "Uclid note: some Uclid builds do not support --version; using --help as availability check."
uclid --help 2>&1 | head -20 || true
echo
z3 --version 2>&1 || true
echo

echo "=== RMC jar ==="
RMC_JAR="$ROOT/TR/tools/rmc-2.14.jar"
if [[ -f "$RMC_JAR" ]]; then
  echo "[OK] $RMC_JAR"
  ls -lh "$RMC_JAR"
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$RMC_JAR"
  elif command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$RMC_JAR"
  fi
else
  echo "[MISSING] $RMC_JAR"
  echo "Download/copy rmc-2.14.jar into TR/tools/ before running the TR/RMC benchmark workflow."
  missing=1
fi
echo

echo "=== Relevant environment variables ==="
env | grep -E 'PATH|JAVA|JDK|MAVEN|LF|LFC|UCLID|Z3|LD_LIBRARY_PATH|_JAVA_OPTIONS' | sort || true
echo

if [[ "$missing" -ne 0 ]]; then
  echo "Environment check failed: at least one required tool is missing."
  exit 1
fi

echo "Environment check passed."
