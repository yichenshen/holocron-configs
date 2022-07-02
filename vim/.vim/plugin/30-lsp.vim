lua << EOF
-- Configure diagnosticss
vim.diagnostic.config({
  virtual_text = {
    severity_limit = vim.diagnostic.severity.INFO,
    prefix = "﮻",
    severity_sort = true,
  }
})

-- Change gutter signs for diagnostics
local signs = { Error = "", Warn = "", Hint = "ﯦ", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
EOF
