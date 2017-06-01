setlocal spell

" vim-autopairs
let b:AutoPairs = {'{': '}', '$': '$', '(': ')', '[': ']'}

" vim-latex
let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats='pdf,dvi'
let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'

let g:Tex_ViewRule_pdf = 'evince_dbus'
let g:Tex_ViewRule_ps = 'evince_dbus'
let g:Tex_ViewRule_dvi = 'evince_dbus'

" Ultisnips
UltiSnipsAddFiletypes tex
UltiSnipsAddFiletypes texmath

