" Press `K` to view the type in the gutter
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
" Type `gd` to go to definition
nnoremap <silent> gd :lua require"telescope.builtin".lsp_definitions()<CR>
nnoremap <silent> gvd :lua require"telescope.builtin".lsp_definitions({jump_type="split"})<CR>
nnoremap <silent> gvd :lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>
nnoremap <silent> gtd :lua require"telescope.builtin".lsp_definitions({jump_type="tab"})<CR>
" Type `gD` to go to declartion
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
" Type `gT` to go to the type declaration
nnoremap <silent> gT :lua require"telescope.builtin".lsp_type_definitions()<CR>
nnoremap <silent> gvT :lua require"telescope.builtin".lsp_type_definitions({jump_type="split"})<CR>
nnoremap <silent> gvT :lua require"telescope.builtin".lsp_type_definitions({jump_type="vsplit"})<CR>
nnoremap <silent> gtT :lua require"telescope.builtin".lsp_type_definitions({jump_type="tab"})<CR>

" Find references for a function/variable
map <leader>uu :lua vim.lsp.buf.references()<CR>
map <leader>ui :lua vim.lsp.buf.incoming_calls()<CR>
map <leader>uo :lua vim.lsp.buf.outgoing_calls()<CR>

" Meta-click (command-click) to go to definition
nnoremap <M-LeftMouse> <LeftMouse>:lua require"telescope.builtin".lsp_definitions()<CR>

" TODO: Rename: use <leader>r and call a function to take an input
" TODO: formatting: <leader>ff normal mode calls vim.lsp.buf.formatting(), visual calls vim.lsp.buf.range_formatting()
