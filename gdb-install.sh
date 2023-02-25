#!/usr/bin/env bash

set -e

if [[ -z "$DOTFILES" ]]; then
    echo "DOTFILES not set!"
    exit 1
fi

pushd "$DOTFILES"/gdb/.config/gdb

git clone https://github.com/hugsy/gef REPO-gef
git clone https://github.com/pwndbg/pwndbg REPO-pwndbg
git clone https://github.com/jerdna-regeiz/splitmind REPO-splitmind

./REPO-pwndbg/setup.sh

pip3 install r2pipe
