lua << EOF
require("trouble").setup{
    icons = true,
    mode = "document_diagnostics",
    fold_open = "",
    fold_closed = "",
    action_keys = {
          open_split = { "s" }, -- open buffer in new split
          open_vsplit = { "v" }, -- open buffer in new vsplit
          open_tab = { "t" } -- open buffer in new tab
    },
    auto_jump = {}, -- Do not jump instead of opening
    use_diagnostic_signs = true -- use lsp client signs
}
EOF

" Setup for various lists
map <leader>ld :TroubleToggle document_diagnostics<CR>
map <leader>lw :TroubleToggle workspace_diagnostics<CR>
map <leader>lc :TroubleToggle quickfix<CR>
map <leader>ll :TroubleToggle loclist<CR>

" References
map <leader>uu :TroubleToggle lsp_references<CR>
map <leader>ud :TroubleToggle lsp_definitions<CR>
map <leader>ut :TroubleToggle lsp_type_definitions<CR>
