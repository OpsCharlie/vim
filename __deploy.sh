#!/bin/bash

P=$1
DIR=$(dirname $(readlink -f $0))

if [ -z "$P" ]; then
    mv ~/.config/nvim{,_bak}
    mv ~/.local/share/nvim{,_bak}
    ln -s "$DIR" ~/.config/nvim
    echo Configure neovim lua
    exit $?
fi

if [ "$(expr match "$P" '.*\(:\)')" = ":" ]; then
    echo "Usage:"
    echo "$0               to deploy local"
    echo "$0 user@host     to deploy remote"
    exit 1
fi

# rsync -avz --delete --exclude ".git" "$DIR/vim/" "$P":~/.vim
# rsync -avz --delete --exclude ".git" "$DIR"/vimrc "$P":~/.vimrc
rsync -avz --delete --exclude .git "$DIR/" "$P":~/.config/nvim
# rsync -avz --delete "$DIR"/vimrc "$P":~/.vimrc
# ssh "$P" "vim +PluginInstall +qall"

