" deoplete
call deoplete#custom#var('omni', 'input_patterns', { 'c': ['[^. *\t]\.\w*', '[^. *\t]\->\w*','#include\s*[<"][^>"]*'] })

" Vim commentary
setlocal commentstring=//\ %s
