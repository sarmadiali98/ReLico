#!/usr/bin/env bash
set -euo pipefail

echo "=== ReLico Docker smoke test ==="
echo

echo "=== Java ==="
java -version
echo

echo "=== Maven ==="
mvn -version
echo

echo "=== Build ReLico translator ==="
mvn -o -B -DskipTests clean package

echo
echo "=== Run ReLico translator on benchmark models ==="
rm -rf compiledLF CompiledLF

mvn -o -B \
  org.codehaus.mojo:exec-maven-plugin:3.1.0:java \
  -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"

echo
echo "=== Generated LF files ==="
find compiledLF CompiledLF -maxdepth 2 -name "*.lf" 2>/dev/null | sort || true

COUNT=$(find compiledLF CompiledLF -maxdepth 2 -name "*.lf" 2>/dev/null | wc -l | tr -d ' ')

if [ "$COUNT" = "0" ]; then
  echo "ERROR: no generated LF files found."
  exit 1
fi

echo
echo "SUCCESS: generated $COUNT LF files."
