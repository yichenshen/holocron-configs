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
map <F9> :AsyncRun -raw node %<cr>
map <F10> :AsyncRun node %<cr>

" Linters
let g:ale_linters.javascript = ['eslint', 'flow-language-server']

" Autocomplete
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.javascriptreact = ['prettier']
let g:ale_fixers["javascript.jsx"] = ['prettier']

" vim-javascript options
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
