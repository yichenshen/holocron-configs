" Line numbers
set number

" Set yank to clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Enable alt keymaps
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Select paste mode
set pastetoggle=<F2>

" Colorscheme
colorscheme elflord

" Line length warning
set colorcolumn=81,101 " absolute columns to highlight "
highlight ColorColumn ctermbg=darkblue

" Tags
set tags=tags;/

" Errors
nnoremap gL :lprev<CR>
nnoremap gl :lnext<CR>

" Mouse scroll on ssh
set mouse=a
