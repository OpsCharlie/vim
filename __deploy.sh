#!/bin/bash

P=$1
DIR=$(dirname $(readlink -f $0))

if [ -z "$P" ]; then
    echo copy files to homedir
    cp -a "$DIR/vim/" ~/.vim/
    cp -a "$DIR/vimrc" ~/.vimrc
    vim +PluginInstall +qall
    exit $?
fi

if [ "$(expr match "$P" '.*\(:\)')" = ":" ]; then
    echo "Usage:"
    echo "$0               to deploy local"
    echo "$0 user@host     to deploy remote"
    exit 1
fi

rsync -avz --delete --exclude ".git" "$DIR/vim/" "$P":~/.vim
rsync -avz --delete --exclude ".git" "$DIR"/vimrc "$P":~/.vimrc
# ssh "$P" "vim +PluginInstall +qall"

