let python_highlight_all = 1
syn keyword pythonDecorator True None False self

" Special types
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

" Folding
map <buffer> F :set foldmethod=indent<cr>

" AsyncRun
map <buffer> <F9> :AsyncRun -raw python3 %<cr>
map <buffer> <F10> :AsyncRun python3 %<cr>
