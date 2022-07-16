lua << EOF
require("nvim-tree").setup({
    view = {
        side = "right",
        width = 35,
        mappings = {
            list = {
                { key = "s", action = "split" },
                { key = "v", action = "vsplit" },
                { key = "t", action = "tabnew" },
            },
        },
    },
})
EOF

map <leader>nn :NvimTreeToggle<cr>
map <leader>nf :NvimTreeFindFileToggle<cr>

" Close vim if only nvim-tree is left
autocmd bufenter * if (winnr("$") == 1 && &filetype ==# 'NvimTree') | q | endif
