#!/bin/bash

P=$1
DIR=$(dirname $(readlink -f $0))

if [ -z $P ]; then
    echo copy files to homedir
    #mv ~/.vim ~/.vim.bak
    #mv ~/.vimrc ~/.vimrc.bak
    #ln -s $DIR/vim ~/.vim
    #ln -s $DIR/vimrc ~/.vimrc
    cp -a $DIR/vim/ ~/.vim/
    cp -a $DIR/vimrc ~/.vimrc
    exit $?
fi

if [ "$(expr match "$P" '.*\(:\)')" = ":" ]; then
    echo "Usage:"
    echo "$0               to deploy local"
    echo "$0 user@host     to deploy remote"
    exit 1
fi

rsync -rptvz --delete --exclude ".git" $DIR/vim/ $P:~/.vim
rsync -rptvz --delete --exclude ".git" $DIR/vimrc $P:~/.vimrc


