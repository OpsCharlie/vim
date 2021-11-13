#!/bin/bash

P=$1
DIR=$(dirname $(readlink -f $0))

if [ -z "$P" ]; then
    echo copy files to homedir
    rsync -a --delete "$DIR/vim/" ~/.vim/
    rsync -a --delete "$DIR/plugins/" ~/.config/nvim/plugins/
    cp -a "$DIR/vimrc" ~/.vimrc
    cp -a "$DIR/coc-settings.json" ~/.config/nvim/coc-settings.json
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
rsync -avz --delete "$DIR/vim/" "$P":~/.vim
rsync -avz --delete "$DIR/plugins/" "$P":~/.config/nvim/plugins/
rsync -avz --delete "$DIR"/vimrc "$P":~/.vimrc
rsync -avz --delete "$DIR/coc-settings.json" "$P":~/.config/nvim/coc-settings.json
# ssh "$P" "vim +PluginInstall +qall"
