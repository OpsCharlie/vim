#!/bin/bash
#vim: set tabstop=4 shiftwidth=4 expandtab:

set -euo pipefail

BIN_DIR="$HOME/bin"
[[ -d "$BIN_DIR" ]] || mkdir -p "$BIN_DIR"

ARCH=$(uname -m)
DIR=$(dirname "$(readlink -f "$0")")

# Check for required commands
for cmd in curl awk; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "$cmd is required but not installed."; exit 1; }
done

# Prefer jq for JSON parsing if available
if command -v jq >/dev/null 2>&1; then
    get_latest_version() {
        curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r .tag_name
    }
else
    get_latest_version() {
        curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/'
    }
fi

download_nvim() {
    local version="$1"
    if ! curl -sL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${ARCH}.appimage" -o "$BIN_DIR/nvim-${version}.appimage"; then
        echo "Download failed"
        exit 1
    fi
    chmod +x "$BIN_DIR/nvim-${version}.appimage"
    ln -sf "$BIN_DIR/nvim-${version}.appimage" "$BIN_DIR/nvim"
}

if command -v "$BIN_DIR/nvim" >/dev/null 2>&1; then
    INSTALLED_VERSION=$("$BIN_DIR/nvim" --version | head -n1 | awk '{print $2}')
    LATEST_VERSION=$(get_latest_version)
    if [ "$INSTALLED_VERSION" = "$LATEST_VERSION" ]; then
        echo "Latest version already installed"
    else
        download_nvim "$LATEST_VERSION"
    fi
else
    LATEST_VERSION=$(get_latest_version)
    download_nvim "$LATEST_VERSION"
fi

cd "$DIR" || exit

NVIM_CONFIG="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG" ] && [ ! -L "$NVIM_CONFIG" ]; then
    echo "Backing up existing nvim config to $NVIM_CONFIG.bak"
    mv "$NVIM_CONFIG" "$NVIM_CONFIG.bak"
    ln -s "$DIR" "$NVIM_CONFIG"
elif [ -L "$NVIM_CONFIG" ]; then
    TARGET=$(readlink -f "$NVIM_CONFIG")
    if [ "$TARGET" = "$DIR" ]; then
        echo "$NVIM_CONFIG is already correctly linked."
    else
        echo "$NVIM_CONFIG is a symlink to $TARGET, updating to $DIR"
        rm "$NVIM_CONFIG"
        ln -s "$DIR" "$NVIM_CONFIG"
    fi
else
    ln -s "$DIR" "$NVIM_CONFIG"
fi
