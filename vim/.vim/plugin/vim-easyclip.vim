let g:EasyClipShareYanks = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

" Remap cut operation
let g:EasyClipUseCutDefaults = 0
nmap dc <Plug>MoveMotionPlug
xmap dc <Plug>MoveMotionXPlug
nmap dC <Plug>MoveMotionEndOfLinePlug
nmap dcc <Plug>MoveMotionLinePlug

" Remap Yank cycle
let g:EasyClipUsePasteToggleDefaults = 0
nmap ]y <plug>EasyClipSwapPasteForward
nmap [y <plug>EasyClipSwapPasteBackwards

" Ctrl-v pastes
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste

" Yank buffer
map <leader>yy :Yanks<cr>
map <leader>ip :IPaste<cr>