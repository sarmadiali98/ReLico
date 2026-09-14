#!/usr/bin/env bash
# Verify the tools required to run the ReLico artifact are present with
# acceptable versions. Prints one line per check; exits nonzero on failure.
set -uo pipefail

fail=0
check() { # check <name> <required:yes/no> <command...>
  local name="$1" required="$2"; shift 2
  if "$@" >/dev/null 2>&1; then
    echo "PASS $name"
  else
    if [ "$required" = "yes" ]; then fail=1; echo "FAIL $name"; else echo "OPTIONAL-MISSING $name"; fi
  fi
}

sha256_of() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
  else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

CACHE_DIR="${RELICO_CACHE_DIR:-$HOME/.cache/relico}"

PYTHON="${RELICO_PYTHON:-python3}"
check "python3>=3.10" yes "$PYTHON" -c 'import sys; raise SystemExit(0 if sys.version_info >= (3, 10) else 1)'
check "git" yes git --version
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
check "lean-toolchain-file" yes test -f "$REPO_ROOT/lean-toolchain"
check "lake" yes lake --version

# lfc: prefer PATH, fall back to the install-dependencies cache location.
LFC_BIN=""
if command -v lfc >/dev/null 2>&1; then
  LFC_BIN="$(command -v lfc)"
else
  LFC_BIN="$(find "$CACHE_DIR/lf" -name lfc -type f 2>/dev/null | head -n 1)"
  if [ -n "$LFC_BIN" ]; then
    echo "NOTE lfc not on PATH; using cached $LFC_BIN"
    echo "     export PATH=\"$(dirname "$LFC_BIN"):\$PATH\""
  fi
fi
if [ -n "$LFC_BIN" ] && "$LFC_BIN" --version >/dev/null 2>&1; then
  echo "PASS lfc"
  lfc_version_output="$("$LFC_BIN" --version 2>/dev/null)"
  if [ "$lfc_version_output" = "lfc 0.11.0" ]; then
    echo "PASS lfc-version(0.11.0)"
  else
    echo "FAIL lfc-version (got: ${lfc_version_output:-none})"
    fail=1
  fi
else
  echo "FAIL lfc (missing; run scripts/install-dependencies.sh --with-lfc and extend PATH)"
  fail=1
fi

check "java>=17" yes java -version
# Maven: honor RELICO_MAVEN, then the same candidate paths the java-bridge
# runners search, and require "Apache Maven" in the output — a bare `mvn` on
# PATH may be an unrelated tool.
MAVEN_BIN="${RELICO_MAVEN:-}"
if [ -z "$MAVEN_BIN" ]; then
  for maven_candidate in \
    /opt/homebrew/opt/maven/bin/mvn \
    /opt/homebrew/bin/mvn \
    /usr/local/bin/mvn \
    "$HOME/.sdkman/candidates/maven/current/bin/mvn"
  do
    if [ -x "$maven_candidate" ] && "$maven_candidate" -version 2>&1 | grep -q "Apache Maven"; then
      MAVEN_BIN="$maven_candidate"
      break
    fi
  done
fi
if [ -z "$MAVEN_BIN" ]; then
  MAVEN_BIN="$(command -v mvn 2>/dev/null || true)"
fi
if [ -n "$MAVEN_BIN" ] && "$MAVEN_BIN" -version 2>&1 | grep -q "Apache Maven"; then
  echo "PASS maven($MAVEN_BIN)"
else
  echo "FAIL maven (no Apache Maven found; set RELICO_MAVEN or install Maven per DEPENDENCIES.md)"
  fail=1
fi
check "cmake" yes cmake --version
check "make" yes make --version
if command -v clang++ >/dev/null 2>&1; then echo "PASS cxx(clang++)"
elif command -v g++ >/dev/null 2>&1; then echo "PASS cxx(g++)"
else echo "FAIL cxx"; fail=1; fi

RMC_JAR="$CACHE_DIR/rmc/2.14/rmc-2.14.jar"
PARSER_ZIP="$CACHE_DIR/parser/2.25/org.rebecalang.compiler-94ca579e0f2e3528d8de608a9e86316ecb78d608.zip"

if [ -f "$RMC_JAR" ]; then
  obs="$(sha256_of "$RMC_JAR")"
  if [ "$obs" = "a39112046d99e0895cf47f890242ace21db896e609f7eef86751a0d416d477f5" ]; then echo "PASS rmc-jar-sha256"
  else echo "FAIL rmc-jar-sha256 (observed $obs)"; fail=1; fi
else
  echo "FAIL rmc-jar (missing: $RMC_JAR — run scripts/install-dependencies.sh)"; fail=1
fi

if [ -f "$PARSER_ZIP" ]; then
  obs="$(sha256_of "$PARSER_ZIP")"
  if [ "$obs" = "bd10366acf8d1ed7f392cdd424bfaea5be162cb291f9521ad3d3cfd32be8dcaf" ]; then echo "PASS parser-zip-sha256"
  else echo "FAIL parser-zip-sha256 (observed $obs)"; fail=1; fi
else
  echo "FAIL parser-zip (missing: $PARSER_ZIP — run scripts/install-dependencies.sh)"; fail=1
fi

if [ "$fail" -eq 0 ]; then echo "verify-environment: OK"; else echo "verify-environment: FAILURES PRESENT"; fi
exit $fail
