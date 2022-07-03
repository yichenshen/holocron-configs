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

" Type `gD` to go to declartion
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>

" Press `K` to view the type in the gutter
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>

" Find incoming calls
map <leader>ui :lua vim.lsp.buf.incoming_calls()<CR>

" Rename with LSP
function! LspRename()
  let rename = input('Rename to: ')
  let cmd = "vim.lsp.buf.rename(\"".rename."\")"
  call luaeval(cmd)
endfunction
noremap <leader>r <cmd>call LspRename()<CR>

" Formatting
let g:lsp_fix_on_save = 1
function! ToggleFixOnSave() abort
  if g:lsp_fix_on_save == 0
    let g:lsp_fix_on_save = 1
  else
    let g:lsp_fix_on_save = 0
  endif
  call lightline#update()
endfunction

function! LSPFix() abort
  if g:lsp_fix_on_save == 1
    lua vim.lsp.buf.formatting_seq_sync()
  endif
endfunction

noremap zaf :call ToggleFixOnSave()<CR>
autocmd BufWritePre <buffer> call LSPFix()

" <leader>ff for manual formatting, visual
nnoremap zf <cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>
vnoremap zf <ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>
