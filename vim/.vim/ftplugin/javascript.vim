function! JavaScriptFold()
    setl foldmethod=syntax
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

" Runners
map <F9> :AsyncRun -raw node %<cr>
map <F10> :AsyncRun node %<cr>

" vim-javascript options
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
