let g:ale_sign_error=''
let g:ale_sign_style_error=''
let g:ale_sign_warning=''
let g:ale_sign_style_warning=''
let g:ale_sign_info=''

augroup LightLineALEUpdate
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END
