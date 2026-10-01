#!/usr/bin/env bash
# Fetch external artifacts with pinned SHA-256 verification.
# Artifacts already present with a matching digest are not re-downloaded.
# Usage: scripts/install-dependencies.sh [--with-lfc] [--with-verifiers]
set -euo pipefail

CACHE_DIR="${RELICO_CACHE_DIR:-$HOME/.cache/relico}"
WITH_LFC=0
WITH_VERIFIERS=0
for arg in "$@"; do
  case "$arg" in
    --with-lfc) WITH_LFC=1 ;;
    --with-verifiers) WITH_VERIFIERS=1 ;;
    --help)
      echo "Usage: scripts/install-dependencies.sh [--with-lfc] [--with-verifiers]"
      exit 0 ;;
    *) echo "unknown option: $arg" >&2; exit 64 ;;
  esac
done

if [ "$WITH_VERIFIERS" -eq 1 ]; then
  case "$(uname -s)-$(uname -m)" in
    Linux-x86_64|Linux-aarch64) ;;
    *)
      echo "UCLID5/Z3 installation supports Linux x86_64 or aarch64 build hosts; native Z3 execution requires x86_64." >&2
      exit 1 ;;
  esac
  JAVA17_HOME="${JAVA17_HOME:-${JAVA_HOME:-}}"
  if [ -z "$JAVA17_HOME" ] || [ ! -x "$JAVA17_HOME/bin/java" ]; then
    echo "UCLID5 build requires JDK 17; set JAVA17_HOME (or JAVA_HOME) to a JDK 17 installation." >&2
    exit 1
  fi
  java_version="$("$JAVA17_HOME/bin/java" -version 2>&1 | sed -n '1p')"
  case "$java_version" in
    *'version "17.'*|*'openjdk version "17.'*) ;;
    *) echo "UCLID5 build requires JDK 17; $JAVA17_HOME reports: $java_version" >&2; exit 1 ;;
  esac
fi

RMC_SHA="a39112046d99e0895cf47f890242ace21db896e609f7eef86751a0d416d477f5"
RMC_URL="https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar"

PARSER_COMMIT="94ca579e0f2e3528d8de608a9e86316ecb78d608"
PARSER_SHA="bd10366acf8d1ed7f392cdd424bfaea5be162cb291f9521ad3d3cfd32be8dcaf"
PARSER_URL="https://github.com/rebeca-lang/org.rebecalang.compiler/archive/${PARSER_COMMIT}.zip"
# Exact filename expected by tests/translator/general--main-actor-priority--negative/run-test.sh
PARSER_NAME="org.rebecalang.compiler-${PARSER_COMMIT}.zip"

LFC_VERSION="0.11.0"
# Expected SHA-256 of the extracted bin/lfc launcher. lf-cli 0.11.0 ships bin/lfc
# as a Gradle-generated POSIX shell JVM launcher (lib/ holds platform-independent
# Java), so it is byte-identical across all four published release archives. Each
# platform archive was downloaded and its extracted bin/lfc hashed to this value;
# see artifact/checksums.tsv. Kept per-platform so a future divergent release is
# caught rather than silently trusted.
case "$(uname -s)-$(uname -m)" in
  Darwin-arm64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-MacOS-aarch64.tar.gz"
    LFC_TAR_SHA="284c37c7d73d717156efabc8ed18ed415e8bd19e80d26a3817a19f7eb2980d28"
    LFC_BIN_SHA="a8e277076ef578a677fdf7731d95d3ee745e47266ea68d37a673f44bf069cf8a" ;;
  Darwin-x86_64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-MacOS-x86_64.tar.gz"
    LFC_TAR_SHA="5d474a694c3e5472841c3c65010655c43b8df854e888483a3800810a5edf1e0e"
    LFC_BIN_SHA="a8e277076ef578a677fdf7731d95d3ee745e47266ea68d37a673f44bf069cf8a" ;;
  Linux-x86_64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-Linux-x86_64.tar.gz"
    LFC_TAR_SHA="abb818f7995994340be9733b82c61074f1447385ecf5102eca023a04312343f0"
    LFC_BIN_SHA="a8e277076ef578a677fdf7731d95d3ee745e47266ea68d37a673f44bf069cf8a" ;;
  Linux-aarch64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-Linux-aarch64.tar.gz"
    LFC_TAR_SHA="6abfc6c0a40ca6496483093d290426ed3e29b98396c179008922d66f7e59d3d9"
    LFC_BIN_SHA="a8e277076ef578a677fdf7731d95d3ee745e47266ea68d37a673f44bf069cf8a" ;;
  *)
    echo "unsupported platform for lfc download: $(uname -s)-$(uname -m)" >&2
    exit 1 ;;
esac
LFC_URL="https://github.com/lf-lang/lingua-franca/releases/download/v${LFC_VERSION}/${LFC_ASSET}"

Z3_VERSION="4.8.8"
Z3_ASSET="z3-${Z3_VERSION}-x64-ubuntu-16.04.zip"
Z3_SHA="6534f26427ee4f02835d17c3472f5ce750f34b4898c35cdd4223459b3589664e"
Z3_URL="https://github.com/Z3Prover/z3/releases/download/z3-${Z3_VERSION}/${Z3_ASSET}"
SBT_VERSION="1.10.11"
SBT_ASSET="sbt-${SBT_VERSION}.tgz"
SBT_SHA="5034a64841b8a9cfb52a341e45b01df2b8c2ffaa87d8d2b0fe33c4cdcabd8f0c"
SBT_URL="https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/${SBT_ASSET}"
UCLID_COMMIT="4fd5e566c5f87b052f92e9b23723a85e1c4d8c1c"

sha256_of() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
  else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

fetch_verified() {
  local url="$1" sha="$2" dest="$3"
  if [ -f "$dest" ] && [ "$(sha256_of "$dest")" = "$sha" ]; then
    echo "OK (cached): $dest"
    return 0
  fi
  mkdir -p "$(dirname "$dest")"
  local tmp="${dest}.download"
  curl --fail --location --show-error --output "$tmp" "$url"
  local observed; observed="$(sha256_of "$tmp")"
  if [ "$observed" != "$sha" ]; then
    rm -f "$tmp"
    echo "SHA-256 mismatch for $url: expected $sha observed $observed" >&2
    exit 65
  fi
  mv "$tmp" "$dest"
  echo "OK (downloaded): $dest"
}

fetch_verified "$RMC_URL" "$RMC_SHA" "$CACHE_DIR/rmc/2.14/rmc-2.14.jar"
fetch_verified "$PARSER_URL" "$PARSER_SHA" "$CACHE_DIR/parser/2.25/$PARSER_NAME"

if [ "$WITH_LFC" -eq 1 ]; then
  tarball="$CACHE_DIR/lf/${LFC_VERSION}/${LFC_ASSET}"
  fetch_verified "$LFC_URL" "$LFC_TAR_SHA" "$tarball"
  lfc_dest="$CACHE_DIR/lf/${LFC_VERSION}/$(uname -s)-$(uname -m)"
  rm -rf "$lfc_dest"
  mkdir -p "$lfc_dest"
  tar -xzf "$tarball" -C "$lfc_dest"
  lfc_bin="$(find "$lfc_dest" -name lfc -type f | head -n 1)"
  if [ -z "$lfc_bin" ]; then echo "lfc binary not found after extraction" >&2; exit 66; fi
  chmod +x "$lfc_bin"
  observed="$(sha256_of "$lfc_bin")"
  echo "lfc binary: $lfc_bin"
  echo "lfc binary SHA-256: $observed"
  if [ "$observed" != "$LFC_BIN_SHA" ]; then
    echo "lfc binary SHA-256 mismatch for $(uname -s)-$(uname -m): expected $LFC_BIN_SHA observed $observed" >&2
    exit 67
  fi
  echo "lfc binary SHA-256 verified against pinned value"
  lfc_bin_dir="$(dirname "$lfc_bin")"
  echo "To use this lfc, add its bin directory to PATH:"
  echo "  export PATH=\"$lfc_bin_dir:\$PATH\""
fi

if [ "$WITH_VERIFIERS" -eq 1 ]; then
  VERIFIER_DIR="$CACHE_DIR/verifiers"
  DOWNLOAD_DIR="$VERIFIER_DIR/downloads"
  BIN_DIR="$VERIFIER_DIR/bin"
  Z3_ARCHIVE="$DOWNLOAD_DIR/$Z3_ASSET"
  SBT_ARCHIVE="$DOWNLOAD_DIR/$SBT_ASSET"
  Z3_INSTALL_DIR="$VERIFIER_DIR/z3/$Z3_VERSION"
  SBT_INSTALL_DIR="$VERIFIER_DIR/sbt/$SBT_VERSION"
  UCLID_SOURCE_DIR="$VERIFIER_DIR/src/uclid-$UCLID_COMMIT"
  UCLID_INSTALL_DIR="$VERIFIER_DIR/uclid/$UCLID_COMMIT"
  UCLID_BIN="$UCLID_INSTALL_DIR/uclid-0.9.5/bin/uclid"

  mkdir -p "$DOWNLOAD_DIR" "$BIN_DIR"
  fetch_verified "$Z3_URL" "$Z3_SHA" "$Z3_ARCHIVE"
  fetch_verified "$SBT_URL" "$SBT_SHA" "$SBT_ARCHIVE"

  z3_tmp="$(mktemp -d "${TMPDIR:-/tmp}/relico-z3.XXXXXX")"
  unzip -q "$Z3_ARCHIVE" -d "$z3_tmp"
  z3_source_dir="$(find "$z3_tmp" -mindepth 1 -maxdepth 1 -type d -name "z3-${Z3_VERSION}-*" | head -n 1)"
  if [ -z "$z3_source_dir" ] || [ ! -f "$z3_source_dir/bin/libz3java.so" ] || \
     [ ! -f "$z3_source_dir/bin/com.microsoft.z3.jar" ]; then
    rm -rf "$z3_tmp"
    echo "Z3 archive is missing expected 4.8.8 binaries or Java bindings." >&2
    exit 66
  fi
  mkdir -p "$Z3_INSTALL_DIR"
  rm -rf "$Z3_INSTALL_DIR/bin"
  cp -R "$z3_source_dir/bin" "$Z3_INSTALL_DIR/bin"
  rm -rf "$z3_tmp"

  if [ ! -x "$UCLID_BIN" ]; then
    if [ ! -d "$UCLID_SOURCE_DIR/.git" ]; then
      mkdir -p "$(dirname "$UCLID_SOURCE_DIR")"
      git init -q "$UCLID_SOURCE_DIR"
      git -C "$UCLID_SOURCE_DIR" remote add origin https://github.com/uclid-org/uclid.git
    fi
    git -C "$UCLID_SOURCE_DIR" fetch --depth 1 origin "$UCLID_COMMIT"
    git -C "$UCLID_SOURCE_DIR" checkout --detach FETCH_HEAD
    actual_commit="$(git -C "$UCLID_SOURCE_DIR" rev-parse HEAD)"
    if [ "$actual_commit" != "$UCLID_COMMIT" ]; then
      echo "UCLID5 source commit mismatch: expected $UCLID_COMMIT observed $actual_commit" >&2
      exit 67
    fi

    mkdir -p "$UCLID_SOURCE_DIR/lib"
    cp "$Z3_INSTALL_DIR/bin/com.microsoft.z3.jar" "$UCLID_SOURCE_DIR/lib/"
    mkdir -p "$SBT_INSTALL_DIR"
    if [ ! -x "$SBT_INSTALL_DIR/bin/sbt" ]; then
      tar -xzf "$SBT_ARCHIVE" -C "$SBT_INSTALL_DIR" --strip-components=1
    fi
    export JAVA_HOME="$JAVA17_HOME"
    export SBT_HOME="$SBT_INSTALL_DIR"
    export PATH="$JAVA17_HOME/bin:$SBT_INSTALL_DIR/bin:$PATH"
    cd "$UCLID_SOURCE_DIR"
    sbt update clean compile "set fork:=true"
    sbt universal:packageBin
    package_zip="$UCLID_SOURCE_DIR/target/universal/uclid-0.9.5.zip"
    if [ ! -f "$package_zip" ]; then
      echo "UCLID5 build did not produce $package_zip" >&2
      exit 68
    fi
    mkdir -p "$UCLID_INSTALL_DIR"
    unzip -qo "$package_zip" -d "$UCLID_INSTALL_DIR"
  fi

  if [ ! -x "$UCLID_BIN" ] || [ ! -x "$Z3_INSTALL_DIR/bin/z3" ]; then
    echo "UCLID5/Z3 installation is incomplete under $VERIFIER_DIR" >&2
    exit 69
  fi
  ln -sfn "$UCLID_BIN" "$BIN_DIR/uclid"
  ln -sfn "$Z3_INSTALL_DIR/bin/z3" "$BIN_DIR/z3"
  if [ "$(uname -m)" = "x86_64" ]; then
    "$Z3_INSTALL_DIR/bin/z3" --version
    PATH="$BIN_DIR:$PATH" LD_LIBRARY_PATH="$Z3_INSTALL_DIR/bin${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
      "$UCLID_BIN" --help >/dev/null
    echo "UCLID5/Z3 commands verified"
  else
    echo "Installed UCLID5 and x86_64 Z3 for an x86_64 runtime; native verifier execution was skipped on $(uname -m)."
  fi
  echo "To use UCLID5/Z3, add the commands and native libraries to your environment:"
  echo "  export PATH=\"$BIN_DIR:\$PATH\""
  echo "  export LD_LIBRARY_PATH=\"$Z3_INSTALL_DIR/bin:\${LD_LIBRARY_PATH:-}\""
fi

echo "install-dependencies: complete"
