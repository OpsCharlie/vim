#!/bin/bash

P=$1
DIR=$(dirname $(readlink -f $0))

if [ -z "$P" ]; then
    rm ~/.config/nvim
    ln -s "$DIR" "$HOME/.config/nvim"
    echo Configure Coc neovim
    exit $?
fi

if ! [ "$(expr match "$P" '.*\(:\)')" = ":" ]; then
    rsync -avz --delete --exclude .git "$DIR/" "$P":~/.config/nvim
    exit $?
fi

echo "Usage:"
echo "$0               to deploy local"
echo "$0 user@host     to deploy remote"
exit 1
