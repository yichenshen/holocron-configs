# Vim (Neovim)

The following vimrcs are designed to be used with neovim, and uses [vim-plug](https://github.com/junegunn/vim-plug) as the package manager.

## Dependencies

 - neovim
 - Patched nerd fonts (refer to the `fonts/` folder)

### For plugins

For most of these plugin dependencies, vim should run fine without them if you do not need the features.

 - ale.vim
  - black: python code formatter
  - isort: sorts python imports
  - flake8: PEP8 linter
  - prettier: JS formatter
 - ack.vim
  - ack: File searcher
 - deoplete.vim
  - flow: Javascript completer

## Setup

> WARNING: install.sh overwrites existing vimrc files.

Run `install.sh`. It does the following:

 - Symlinks both `.vimrc` and `.vim` to `~`
  - `vimrc` contains the vim-plug packages
  - `.vim` contains custom configs for languages and the plugins
 - Symlinks `init.vim` to `~/.config/nvim/init.vim`
  - This makes neovim make use of traditional vim's config structure
