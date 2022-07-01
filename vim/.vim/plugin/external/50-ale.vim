" We'll only use it for fixers for now
let g:ale_enabled=0

" Autoformat
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1
noremap <leader>ff :ALEFix<CR>

function! ToggleALEFixer() abort
  if g:ale_fix_on_save == 0
    let g:ale_fix_on_save = 1
  else
    let g:ale_fix_on_save = 0
  endif
  call lightline#update()
endfunction

noremap zaf :call ToggleALEFixer()<CR>
