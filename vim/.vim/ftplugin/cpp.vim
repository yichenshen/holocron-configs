" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'cpp': ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" Autoformat
let g:ale_fixers.c = ['clang-format']
let g:ale_fixers.cpp = ['clang-format']
