#!/usr/bin/env sh
set -eu

RECEIPT_CLI_VERSION="${RECEIPT_CLI_VERSION:-v0.1.0-preview.6}"
RECEIPT_CLI_REPO="${RECEIPT_CLI_REPO:-skishore23/receipt-cli}"
RECEIPT_CLI_BIN_DIR="${RECEIPT_CLI_BIN_DIR:-${HOME}/.local/bin}"
RECEIPT_CLI_BIN="${RECEIPT_CLI_BIN:-${RECEIPT_CLI_BIN_DIR}/receipt}"

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

platform() {
  os="$(uname -s)"
  arch="$(uname -m)"

  case "$os" in
    Darwin) os="darwin" ;;
    Linux) os="linux" ;;
    *)
      echo "Unsupported OS: $os" >&2
      exit 1
      ;;
  esac

  case "$arch" in
    arm64|aarch64) arch="arm64" ;;
    x86_64|amd64) arch="x64" ;;
    *)
      echo "Unsupported architecture: $arch" >&2
      exit 1
      ;;
  esac

  printf "%s-%s" "$os" "$arch"
}

verify_checksum() {
  file="$1"
  if command -v shasum >/dev/null 2>&1; then
    grep "  ${file}$" checksums.txt | shasum -a 256 -c -
    return
  fi
  if command -v sha256sum >/dev/null 2>&1; then
    grep "  ${file}$" checksums.txt | sha256sum -c -
    return
  fi
  echo "Missing required command: shasum or sha256sum" >&2
  exit 1
}

need curl
need tar

target="$(platform)"
asset="receipt-${target}.tar.gz"
base_url="https://github.com/${RECEIPT_CLI_REPO}/releases/download/${RECEIPT_CLI_VERSION}"
tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT INT TERM

mkdir -p "$RECEIPT_CLI_BIN_DIR"

cd "$tmp_dir"
curl -fsSLO "${base_url}/${asset}"
curl -fsSLO "${base_url}/checksums.txt"
verify_checksum "$asset"
tar -xzf "$asset"
install -m 0755 "receipt-${target}" "$RECEIPT_CLI_BIN"

echo "Installed receipt CLI at ${RECEIPT_CLI_BIN}"
case ":${PATH}:" in
  *":${RECEIPT_CLI_BIN_DIR}:"*) ;;
  *)
    echo "Add ${RECEIPT_CLI_BIN_DIR} to PATH to run 'receipt' from any shell." >&2
    ;;
esac
