#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/jakobneri/linux_essentials.git"
DEFAULT_DIR="${HOME}/linux_essentials"

# 1. Repo-Verzeichnis bestimmen: lokal vorhanden, schon geklont, oder neu klonen
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/programs/install.sh" ]; then
  REPO_DIR="$SCRIPT_DIR"
elif [ -d "$DEFAULT_DIR/.git" ]; then
  REPO_DIR="$DEFAULT_DIR"
else
  git clone "$REPO_URL" "$DEFAULT_DIR"
  REPO_DIR="$DEFAULT_DIR"
fi

cd "$REPO_DIR"

# 2. Standard-Programme installieren
bash programs/install.sh

# 3. Configs symlinken
mkdir -p "$HOME/.config/btop/themes" "$HOME/.config/htop"

ln -sf "$REPO_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$REPO_DIR/btop/themes/pastel.theme" "$HOME/.config/btop/themes/pastel.theme"
ln -sf "$REPO_DIR/htop/htoprc" "$HOME/.config/htop/htoprc"

SOURCE_LINE="source \"$REPO_DIR/bashrc/aliases.sh\""
if ! grep -qF "$SOURCE_LINE" "$HOME/.bashrc" 2>/dev/null; then
  {
    echo ""
    echo "# linux_essentials aliases"
    echo "$SOURCE_LINE"
  } >> "$HOME/.bashrc"
fi

echo "Setup abgeschlossen. 'source ~/.bashrc' oder neue Shell starten."
