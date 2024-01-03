lua << EOF

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'v',   api.node.open.vertical,              opts('Open: Vertical Split'))
  vim.keymap.set('n', 's',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't',   api.node.open.tab,                   opts('Open: New Tab'))
end


require("nvim-tree").setup({
    view = {
        side = "right",
        width = 50,
    },
    on_attach=on_attach,
})
EOF

map <leader>nn :NvimTreeToggle<cr>
map <leader>nf :NvimTreeFindFileToggle<cr>

" Close vim if only nvim-tree is left
autocmd bufenter * if (winnr("$") == 1 && &filetype ==# 'NvimTree') | q | endif
