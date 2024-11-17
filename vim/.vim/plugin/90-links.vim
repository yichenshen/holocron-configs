" Show file and line position
map <leader>ppf :call CopyToClipboard(@%)<CR>:echo @%<CR>
map <leader>ppl :call CopyToClipboard(@%.':'.line('.'))<CR>:echo @%.':'.line('.')<CR>
map <leader>pff :call CopyToClipboard(expand('%:t'))<CR>:echo expand('%:t')<CR>
map <leader>pfl :call CopyToClipboard(expand('%:t').':'.line('.'))<CR>:echo expand('%:t').':'.line('.')<CR>

function! CopyToClipboard(val)
  let @* = a:val
endfunction
