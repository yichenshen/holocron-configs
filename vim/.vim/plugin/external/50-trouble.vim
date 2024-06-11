lua << EOF
require("trouble").setup{
    modes = {
        symbols = {
            win = { size = 45 },
        },
    },
    action_keys = {
          open_split = { "s" }, -- open buffer in new split
          open_vsplit = { "v" }, -- open buffer in new vsplit
          open_tab = { "t" } -- open buffer in new tab
    },
    icons = {
        kinds = {
            Array         = "󰅪 ",
            Class         = "󱏒 ",
            Event         = "󱐌 ",
            File          = " ",
            Key           = " ",
            Object        = "󰘦 ",
            Operator      = "󱓉 ",
            String        = "󰅳 ",
            TypeParameter = " ",
            Variable      = "󰫧 ",
        },
    },
}
EOF

" Setup for various lists
map <leader>ld :Trouble diagnostics toggle<CR>
map <leader>lc :Trouble quickfix toggle<CR>
map <leader>ll :Trouble loclist toggle<CR>

" References
map <leader>uu :Trouble lsp_references toggle<CR>
map <leader>ud :Trouble lsp_definitions toggle<CR>
map <leader>ut :Trouble lsp_type_definitions toggle<CR>
map <leader>tt :Trouble symbols toggle<CR>
