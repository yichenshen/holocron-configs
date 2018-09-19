let python_highlight_all = 1
syn keyword pythonDecorator True None False self

" Special types
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

" Folding
map <buffer> F :set foldmethod=indent<cr>

" AsyncRun
map <F5> :AsyncRun -raw python3 %<cr>
map <F6> :AsyncRun python3 %<cr>

" Jedi
let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "ga"
let g:jedi#usages_command = "<leader>u"
