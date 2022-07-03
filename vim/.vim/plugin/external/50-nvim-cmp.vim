lua << EOF
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.abort()
        vim.cmd('stopinsert')
      else
        fallback()
      end
    end),
    ['<C-e>'] = cmp.mapping.confirm({
      select = false,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help'},
    },
    {
      { name = 'buffer' },
      { name = 'path' },
    }
  )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp_document_symbol'},
    },
    {
      { name = 'buffer' },
    }
  )
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {
      { name = 'path' },
    },
    {
      { name = 'buffer' },
      { name = 'cmdline' }
    }
  )
})
EOF
