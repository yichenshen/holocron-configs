"vim-autoformat
let g:formatdef_my_custom_cpp = '"astyle --mode=c --style=google -W -pcHs".&shiftwidth'
let g:formatters_cpp = ['my_custom_cpp']

" FSwitch
nmap <silent> gss :FSHere<cr>
nmap <silent> gsl :FSSplitRight<cr>
nmap <silent> gsh :FSSplitLeft<cr>
nmap <silent> gsk :FSSplitAbove<cr>
nmap <silent> gsj :FSSplitBelow<cr>

" Ultisnips
UltiSnipsAddFiletypes cpp
