lua << EOF
local null_ls = require("null-ls")
null_ls.setup({
      sources = {
            -- newlines
            require("none-ls.formatting.trim_newlines"),
            -- javascript
            require("none-ls.formatting.eslint"),
            require("none-ls.code_actions.eslint"),
            require("none-ls.diagnostics.eslint"),
            null_ls.builtins.formatting.prettier.with({
              extra_args = { "--no-semi" }
            }),
            -- shell
            require("none-ls-shellcheck.diagnostics"),
            require("none-ls-shellcheck.code_actions"),
            -- fish
            null_ls.builtins.diagnostics.fish,
            null_ls.builtins.formatting.fish_indent,
      },
})
EOF
