let g:EasyClipShareYanks = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseGlobalPasteToggle = 0

" Remap cut operation
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseCutDefaults = 0
nmap dc "_d
xmap x "_d
nmap dcc "_dd

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
