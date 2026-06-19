#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(tmux btop htop)

sudo apt-get update
sudo apt-get install -y "${PACKAGES[@]}"

echo "Programme installiert: ${PACKAGES[*]}"
