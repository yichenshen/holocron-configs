" Override some settings to make config work with VSCode Neovim
if exists('g:vscode')

  " This needs to be 0, or extension doesn't tracker cursor properly
  set foldcolumn=0

  " VSCode uses :w for Save and :w! for Save As (refer to amix.vim)
  nmap <leader>w :w<cr>

endif
