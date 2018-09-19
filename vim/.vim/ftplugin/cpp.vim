" vim-autoformat
let g:formatdef_my_custom_cpp = '"astyle --mode=c --style=google -W -pcHs".&shiftwidth'
let g:formatters_cpp = ['my_custom_cpp']

" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'cpp': ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" FSwitch
nmap <silent> gsf :FSHere<cr>
nmap <silent> gsl :FSSplitRight<cr>
nmap <silent> gsh :FSSplitLeft<cr>
nmap <silent> gsk :FSSplitAbove<cr>
nmap <silent> gsj :FSSplitBelow<cr>

