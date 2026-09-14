#!/usr/bin/env bash
# Fetch external artifacts with pinned SHA-256 verification.
# Artifacts already present with a matching digest are not re-downloaded.
# Usage: scripts/install-dependencies.sh [--with-lfc]
set -euo pipefail

CACHE_DIR="${RELICO_CACHE_DIR:-$HOME/.cache/relico}"
WITH_LFC=0
for arg in "$@"; do
  case "$arg" in
    --with-lfc) WITH_LFC=1 ;;
    *) echo "unknown option: $arg" >&2; exit 64 ;;
  esac
done

RMC_SHA="a39112046d99e0895cf47f890242ace21db896e609f7eef86751a0d416d477f5"
RMC_URL="https://github.com/rebeca-lang/org.rebecalang.rmc/releases/download/2.14/rmc-2.14.jar"

PARSER_COMMIT="94ca579e0f2e3528d8de608a9e86316ecb78d608"
PARSER_SHA="bd10366acf8d1ed7f392cdd424bfaea5be162cb291f9521ad3d3cfd32be8dcaf"
PARSER_URL="https://github.com/rebeca-lang/org.rebecalang.compiler/archive/${PARSER_COMMIT}.zip"
# Exact filename expected by tests/translator/general--main-actor-priority--negative/run-test.sh
PARSER_NAME="org.rebecalang.compiler-${PARSER_COMMIT}.zip"

LFC_VERSION="0.11.0"
# Verified binary SHA (macOS-aarch64). Other platforms: the script records the
# observed binary SHA after extraction; no placeholder checksum is assumed.
LFC_BIN_SHA_MACOS_ARM="a8e277076ef578a677fdf7731d95d3ee745e47266ea68d37a673f44bf069cf8a"
case "$(uname -s)-$(uname -m)" in
  Darwin-arm64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-MacOS-aarch64.tar.gz"
    LFC_TAR_SHA="284c37c7d73d717156efabc8ed18ed415e8bd19e80d26a3817a19f7eb2980d28" ;;
  Darwin-x86_64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-MacOS-x86_64.tar.gz"
    LFC_TAR_SHA="5d474a694c3e5472841c3c65010655c43b8df854e888483a3800810a5edf1e0e" ;;
  Linux-x86_64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-Linux-x86_64.tar.gz"
    LFC_TAR_SHA="abb818f7995994340be9733b82c61074f1447385ecf5102eca023a04312343f0" ;;
  Linux-aarch64)
    LFC_ASSET="lf-cli-${LFC_VERSION}-Linux-aarch64.tar.gz"
    LFC_TAR_SHA="6abfc6c0a40ca6496483093d290426ed3e29b98396c179008922d66f7e59d3d9" ;;
  *)
    echo "unsupported platform for lfc download: $(uname -s)-$(uname -m)" >&2
    exit 1 ;;
esac
LFC_URL="https://github.com/lf-lang/lingua-franca/releases/download/v${LFC_VERSION}/${LFC_ASSET}"

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
  if [ "$observed" = "$LFC_BIN_SHA_MACOS_ARM" ]; then
    echo "lfc binary SHA-256 verified against pinned value"
  else
    echo "NOTE: record this binary-level SHA in artifact/checksums.tsv for this platform before use" >&2
  fi
  lfc_bin_dir="$(dirname "$lfc_bin")"
  echo "To use this lfc, add its bin directory to PATH:"
  echo "  export PATH=\"$lfc_bin_dir:\$PATH\""
fi

echo "install-dependencies: complete"
