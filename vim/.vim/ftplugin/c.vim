" vim-autoformat
let g:formatdef_my_custom_c = '"astyle --mode=c --style=google -W -pcHs".&shiftwidth'
let g:formatters_c = ['my_custom_c']

" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'c': ['[^. *\t]\.\w*', '[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })
