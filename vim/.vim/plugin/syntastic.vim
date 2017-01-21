" Autorun synatastic on save
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1


