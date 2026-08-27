#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(tmux btop htop)

sudo apt-get update
sudo apt-get install -y "${PACKAGES[@]}"

echo "Programme installiert: ${PACKAGES[*]}"

# Claude Code CLI (nativer Installer, kein apt-Paket)
if ! command -v claude >/dev/null 2>&1; then
  curl -fsSL https://claude.ai/install.sh | bash
  echo "Claude Code installiert."
else
  echo "Claude Code bereits installiert, überspringe."
fi
