" Setup
lua << EOF
require('telescope').setup{
    defaults = {
       mappings = {
            i = {
                ["<C-s>"] = "select_horizontal",
            },
            n = {
                ["<C-s>"] = "select_horizontal",
            }
        }
    }
}

require('telescope').load_extension('vim_bookmarks')
EOF

" Navigation
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

" Files
noremap <c-p> <cmd>Telescope find_files<CR>
noremap <c-b> <cmd>Telescope old_files<CR>
" Buffers
noremap <c-o> <cmd>Telescope buffers<CR>
noremap <c-g> <cmd>Telescope jumplist<CR>
" Symbols
noremap <c-t> <cmd>Telescope lsp_document_symbols<CR>
noremap <c-s> <cmd>Telescope lsp_workspace_symbols<CR>
" Grep
noremap <c-f> <cmd>Telescope live_grep<CR>
" Bookmarks
map ml <cmd>Telescope vim_bookmarks current_file<CR>
map ma <cmd>Telescope vim_bookmarks all<CR>
