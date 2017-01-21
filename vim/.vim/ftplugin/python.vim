let python_highlight_all = 1
syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

map <buffer> F :set foldmethod=indent<cr>

inoremap <buffer> $r return
inoremap <buffer> $i import
inoremap <buffer> $p print
inoremap <buffer> $f #--- <esc>a
map <buffer> <leader>1 /class
map <buffer> <leader>2 /def
map <buffer> <leader>C ?class
map <buffer> <leader>D ?def

" syntastic
let g:syntastic_python_checkers=['python']
