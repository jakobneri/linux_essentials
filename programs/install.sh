#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(tmux btop htop docker.io)

sudo apt-get update
sudo apt-get install -y "${PACKAGES[@]}"

# cloudflared: kein apt-Paket, Binary direkt von Cloudflare
if ! command -v cloudflared >/dev/null 2>&1; then
  case "$(uname -m)" in
    aarch64) CF_ARCH="arm64" ;;
    armv7l)  CF_ARCH="arm" ;;
    x86_64)  CF_ARCH="amd64" ;;
    *) echo "Unbekannte Architektur: $(uname -m)" >&2; exit 1 ;;
  esac

  TMP_BIN="$(mktemp)"
  curl -fsSL -o "$TMP_BIN" \
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${CF_ARCH}"
  sudo install -m 755 "$TMP_BIN" /usr/local/bin/cloudflared
  rm -f "$TMP_BIN"
fi

echo "Programme installiert: ${PACKAGES[*]} cloudflared"
