" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'cpp': ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" Linters
let g:ale_linters.c = ['gcc']
let g:ale_linters.cpp = ['gcc']

" Autoformat
let g:ale_fixers.c = ['clang-format']
let g:ale_fixers.cpp = ['clang-format']

" fswitch
au BufEnter *.h let b:fswitchdst = 'cpp,cc,c'
au BufEnter *.cc let b:fswitchdst = 'h'
