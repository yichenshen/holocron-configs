" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'cpp': ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" fswitch
au BufEnter *.h let b:fswitchdst = 'cpp,cc,c'
au BufEnter *.cc let b:fswitchdst = 'h'

" Vim commentary
setlocal commentstring=//\ %s
