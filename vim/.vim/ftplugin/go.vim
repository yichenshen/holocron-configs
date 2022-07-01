" Autoformat
let g:ale_fixers.go = ['gofmt']

" Clangd setup
lua require('lspconfig').gopls.setup{}
LspStart
