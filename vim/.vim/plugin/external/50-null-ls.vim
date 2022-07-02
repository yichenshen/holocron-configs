lua << EOF
local null_ls = require("null-ls")
null_ls.setup({
      sources = {
            -- general
            null_ls.builtins.formatting.trim_newlines,
            null_ls.builtins.formatting.trim_whitespace,
            -- python
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.formatting.black.with({
              extra_args = { "-l", "79" }
            }),
            null_ls.builtins.formatting.isort,
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
            -- ruby
            null_ls.builtins.diagnostics.rubocop,
            -- go
            null_ls.builtins.formatting.gofmt,
      },
})
EOF
