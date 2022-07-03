" LSP setups
lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

local servers = { "clangd", "hhvm", "gopls" }
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup{ capabilities = capabilities }
end
EOF
