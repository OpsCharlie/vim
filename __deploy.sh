BIN_DIR=~/.local/bin
[[ -d $BIN_DIR ]] || mkdir -p  $BIN_DIR

DIR=$(dirname "$(readlink -f "$0")")

curl -s https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -L -o $BIN_DIR/nvim

chmod +x $BIN_DIR/nvim

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
