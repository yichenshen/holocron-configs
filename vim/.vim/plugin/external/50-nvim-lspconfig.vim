" Type `gd` to go to definition
nnoremap <silent> gd :lua require"telescope.builtin".lsp_definitions()<CR>
nnoremap <silent> gvd :lua require"telescope.builtin".lsp_definitions({jump_type="split"})<CR>
nnoremap <silent> gvd :lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>
nnoremap <silent> gtd :lua require"telescope.builtin".lsp_definitions({jump_type="tab"})<CR>
" Type `gT` to go to the type declaration
nnoremap <silent> gT :lua require"telescope.builtin".lsp_type_definitions()<CR>
nnoremap <silent> gvT :lua require"telescope.builtin".lsp_type_definitions({jump_type="split"})<CR>
nnoremap <silent> gvT :lua require"telescope.builtin".lsp_type_definitions({jump_type="vsplit"})<CR>
nnoremap <silent> gtT :lua require"telescope.builtin".lsp_type_definitions({jump_type="tab"})<CR>

" Meta-click (command-click) to go to definition
nnoremap <M-LeftMouse> <LeftMouse>:lua require"telescope.builtin".lsp_definitions()<CR>

" LSP setups
lua << EOF
local servers = { "clangd", "hhvm", "gopls" }
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup{}
end
EOF
