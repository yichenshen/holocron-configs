function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

call JavaScriptFold()
setl fen

" ultisnips
UltiSnipsAddFiletypes javascript-node

" ESLint
let g:syntastic_javascript_checkers=['eslint']

" Runners
map <F5> :AsyncRun -raw node %<cr>
map <F6> :AsyncRun node %<cr>

