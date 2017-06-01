" Line numbers
set number

" Avoid generating backup files
set nobackup

" Auto indent while typing
set autoindent

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

" Lower delays for ESC key
set timeout ttimeoutlen=50

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
nnoremap <leader>p :lprev<CR>
nnoremap <leader>n :lnext<CR>

" Mouse scroll on ssh
set mouse=a
