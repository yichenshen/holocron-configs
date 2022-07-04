lua << EOF
local null_ls = require("null-ls")
null_ls.setup({
      sources = {
            -- general
            null_ls.builtins.formatting.trim_newlines,
            null_ls.builtins.formatting.trim_whitespace,
            -- javascript
            null_ls.builtins.code_actions.eslint,
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.formatting.eslint,
            null_ls.builtins.formatting.prettier.with({
              extra_args = { "--no-semi" }
            }),
            -- shell
            null_ls.builtins.code_actions.shellcheck,
            null_ls.builtins.diagnostics.shellcheck,
            -- fish
            null_ls.builtins.diagnostics.fish,
            null_ls.builtins.formatting.fish_indent,
      },
})
EOF
