setlocal spell

" vim-autopairs
let b:AutoPairs = {'{': '}', '$': '$', '(': ')', '[': ']'}

" vim-latex
let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats='pdf,dvi'
let g:Tex_CompileRule_pdf = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode $*'

let g:Tex_ViewRule_pdf = 'evince_dbus'
let g:Tex_ViewRule_ps = 'evince_dbus'
let g:Tex_ViewRule_dvi = 'evince_dbus'

let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
let g:Tex_IgnoredWarnings =
      \'deprecated'."\n".
      \"'labeldate' option used to determine whether to"."\n".
      \'Deprecated'."\n"

" Ultisnips
UltiSnipsAddFiletypes texmath

