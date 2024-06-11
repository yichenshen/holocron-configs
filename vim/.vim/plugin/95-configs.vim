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

" Select paste mode
set pastetoggle=<F2>

" Update interval
set updatetime=1000

" Colors
set t_Co=256
set termguicolors
colorscheme one
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Line length warning
set colorcolumn=81,121 " absolute columns to highlight "
highlight ColorColumn ctermbg=darkblue
highlight ColorColumn guibg=#2196F3

" Tags
set tags=tags;/

" Errors
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [c :cprev<CR>
nnoremap ]c :cnext<CR>

" Toggle lists
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction


" Highlight tabs
syn match tab display "\t"
hi link tab Error

" Set automatic folding
set foldmethod=syntax
set foldlevelstart=9001

" Show the syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
