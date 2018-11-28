#! /bin/bash

ln -s -f $(git rev-parse --show-toplevel)/fish/functions/*.fish ~/.config/fish/functions/
ln -s -f $(git rev-parse --show-toplevel)/fish/conf.d/*.fish ~/.config/fish/conf.d/
ln -s -f $(git rev-parse --show-toplevel)/fish/fishfile ~/.config/fish/
ln -s -f $(git rev-parse --show-toplevel)/fish/fish_colors ~/.config/fish/