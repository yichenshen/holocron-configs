let g:ale_sign_error=''
let g:ale_sign_style_error=''
let g:ale_sign_warning=''
let g:ale_sign_style_warning=''
let g:ale_sign_info=''

augroup LightLineALEUpdate
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

" Press `K` to view the type in the gutter
nnoremap <silent> K :ALEHover<CR>
" Type `gd` to go to definition
nnoremap <silent> gd :ALEGoToDefinition<CR>
" gk shows more details about an error
nnoremap <silent> gk :ALEDetail<CR>
" Find references for a function/variable
map <leader>u :ALEFindReferences<CR>
" Meta-click (command-click) to go to definition
nnoremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>

" Autoformat
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1
noremap <leader>ff :ALEFix<CR>
