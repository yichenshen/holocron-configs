" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'c': ['[^. *\t]\.\w*', '[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" Autoformat
let g:ale_fixers.c = ['clang-format']
