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
nnoremap gE :cprev<CR>
nnoremap ge :cprev<CR>

" Mouse scroll on ssh
set mouse=a

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

map <leader>lc :call ToggleList("Location List", 'l')<CR>
map <leader>cc :call ToggleList("Quickfix List", 'c')<CR>
