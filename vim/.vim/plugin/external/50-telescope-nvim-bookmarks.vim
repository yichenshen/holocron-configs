" telescope removed get_default so we monkey patch it in
lua require('telescope.utils').get_default = vim.F.if_nil
