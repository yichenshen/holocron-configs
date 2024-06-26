# Vim (Neovim)

The following vimrcs are designed to be used with neovim, and uses [vim-plug](https://github.com/junegunn/vim-plug) as the package manager.

## Dependencies

- neovim
- Patched nerd fonts (refer to the `fonts/` folder)
- C compiler to complie fzf

### For plugins

These are mostly explicitly configured for some LSP related config. If there're missing the LSP features should just be off by default without errors.

- nvim-lspconfig.vim

  - pylsp: Python LSP
    - flake8: linter
    - black/python-lsp-black: formatter
    - isort/pyls-isort: formatter
    - jedi: completion and code engine
  - prettier: JS formatter
  - eslint: JS linter
  - clangd: C++ LSP
  - hhvm: Hack LSP
  - golsp: Go LSP
  - solargraph: Ruby LSP
  - rust-analyzer: Rust LSP
   - rustfmt: formatter

- telescope.vim
  - rip-grep: File searcher

## Neovim setup

After installing neovim, make sure it has Python/Ruby/Node support:

```
pip3 install --user neovim
pip2 install --user neovim
gem install -N neovim
sudo npm install -g neovim
```

> Try not to install the system packages for these since they tend to be out of date.

## Setup

> WARNING: install.sh overwrites existing vimrc files.

Run `install.sh`. It does the following:

- Symlinks both `.vimrc` and `.vim` to `~`
  - `vimrc` contains the vim-plug packages
  - `.vim` contains custom configs for languages and the plugins
- Symlinks `init.vim` to `~/.config/nvim/init.vim`
  - This makes neovim make use of traditional vim's config structure
- Installs vim-plug

## Install plugins

Start neovim and run `:PlugInstall` to install the plugins.
