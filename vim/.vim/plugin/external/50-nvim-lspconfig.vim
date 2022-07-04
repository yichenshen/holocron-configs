" LSP setups
lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

local servers = { "clangd", "hhvm", "gopls"}
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup{ capabilities = capabilities }
end

require("lspconfig").pylsp.setup {
  settings = {
    pylsp = {
      configurationSources = {"flake8"},
      plugins = {
        autopep8 = {enabled = false},
        pycodestyle = {enabled = false},
        flake8 = {enabled = true},
        isort = {enabled = true},
        yapf = {enabled = false},
        mccabe = {enabled = false},
        pyflakes = {enabled = false},
        black = {
          enabled = true,
          line_length = 79,
        },
      }
    }
  },
  capabilities = capabilities
}
EOF
