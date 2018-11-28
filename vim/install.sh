#! /bin/bash

ln -s -f $(git rev-parse --show-toplevel)/vim/.vimrc ~/.vimrc
ln -s -f -n $(git rev-parse --show-toplevel)/vim/.vim ~/.vim

mkdir -p ~/.config/nvim/
ln -s -f $(git rev-parse --show-toplevel)/vim/init.vim ~/.config/nvim/init.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
