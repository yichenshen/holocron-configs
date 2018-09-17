let python_highlight_all = 1
syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

map <buffer> F :set foldmethod=indent<cr>

" deoplete input
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'python': '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
      \ })

map <F5> :AsyncRun -raw python3 %<cr>
map <F6> :AsyncRun python3 %<cr>

