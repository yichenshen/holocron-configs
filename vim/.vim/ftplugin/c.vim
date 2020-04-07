" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'c': ['[^. *\t]\.\w*', '[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" Linters
let g:ale_linters.c = ['gcc']

" Autoformat
let g:ale_fixers.c = ['clang-format']
