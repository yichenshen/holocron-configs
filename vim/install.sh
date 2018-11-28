#! /bin/bash

ln -s -f $(git rev-parse --show-toplevel)/vim/.vimrc ~/.vimrc
ln -s -f $(git rev-parse --show-toplevel)/vim/.vim ~/.vim

mkdir -p ~/.config/nvim/
ln -s -f $(git rev-parse --show-toplevel)/vim/init.vim ~/.config/nvim/init.vim
