if $TERM != 'linux'
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ ['mode', 'paste', 'fixer'],
        \             ['fugitive', 'readonly', 'filename', 'modified'],
        \             ['asyncrun', 'ctrlpmark'] ],
        \   'right': [ ['lineinfo'],
        \              ['percent'],
        \              ['lsp'],
        \              ['spell', 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode',
        \ },
        \ 'component_expand': {
        \   'fugitive': 'LightLineFugitive',
        \   'lsp': 'LspStatus',
        \   'asyncrun': 'LightlineAsyncRunnerIndicator',
        \   'fixer': 'LightlineLSPFixerOffIndicator'
        \ },
        \ 'component_type': {
        \   'fugitive': 'tabsel',
        \   'lsp': 'error',
        \   'asyncrun': 'warning',
        \   'fixer': 'error'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
endif

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '' : &modifiable ? '' : ''
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return &ft == 'NvimTree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler'
      let mark = ' '  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat.' '.WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype.' '.WebDevIconsGetFileTypeSymbol() : 'no ft ') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return &ft == 'NvimTree' ? 'NvimTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:let g:syntastic_always_populate_loc_list = lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! LspStatus() abort
  return trim(luaeval("require('lsp-status').status()"))
endfunction

function! LightlineAsyncRunnerIndicator() abort
  return g:asyncrun_status == 'running' ? '' : ''
endfunction

function! LightlineLSPFixerOffIndicator() abort
  return g:lsp_fix_on_save == 0 ? '󰁨' : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
