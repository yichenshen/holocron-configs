" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'c': ['[^. *\t]\.\w*', '[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" Autoformat
let g:ale_fixers.c = ['clang-format']

" Vim commentary
setlocal commentstring=//\ %s

" Clangd setup
lua require('lspconfig').clangd.setup{}
LspStart
