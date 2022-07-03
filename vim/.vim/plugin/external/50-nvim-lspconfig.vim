" LSP setups
lua << EOF
local servers = { "clangd", "hhvm", "gopls" }
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup{}
end
EOF
