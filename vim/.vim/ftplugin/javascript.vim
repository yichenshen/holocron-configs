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

" Runners
map <F5> :AsyncRun -raw node %<cr>
map <F6> :AsyncRun node %<cr>

" Autocomplete
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers["javascript.jsx"] = ['prettier']

" vim-javascript options
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
