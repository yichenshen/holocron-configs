"vim-autoformat
let g:formatdef_my_custom_c = '"astyle --mode=c --style=google -W -pcHs".&shiftwidth'
let g:formatters_c = ['my_custom_c']
