" Use deoplete
let g:deoplete#enable_at_startup = 1
" Use smartcase
call deoplete#custom#option('smart_case', 1)
" Set the minimum autocompletion trigger length
let g:deoplete#auto_completion_start_length = 1

" Keyword for normal files
call deoplete#custom#option('keyword_patterns', { 'default': '\h\w*' })

" Put snippets above buffers, but below most sources
call deoplete#custom#source('ultisnips', 'rank', 400)

" Plugin key-mappings.
inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" <C-Space> forces autocomplete
inoremap <expr><C-Space> deoplete#manual_complete()

" Map tab to iterate through candidates
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
