" telescope removed get_default so we monkey patch it in
lua << EOF
utils = require('telescope.utils')

utils.get_default = function(x, default)
    return vim.F.if_nil(x, default)
end
EOF
