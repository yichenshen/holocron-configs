lua << EOF
local null_ls = require("null-ls")
null_ls.setup({
      sources = {
            -- python
            null_ls.builtins.diagnostics.flake8,
            -- javascript
            null_ls.builtins.code_actions.eslint,
            null_ls.builtins.diagnostics.eslint,
            -- shell
            null_ls.builtins.code_actions.shellcheck,
            null_ls.builtins.diagnostics.shellcheck,
            -- fish
            null_ls.builtins.diagnostics.fish,
            -- ruby
            null_ls.builtins.diagnostics.rubocop,
      },
})
EOF
