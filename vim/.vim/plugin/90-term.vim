let g:iterm   = exists('$ITERM_PROFILE') || exists('$ITERM_SESSION_ID') || filereadable(expand("~/.vim/.assume-iterm"))
let g:screen  = &term =~ 'screen'
let g:tmux    = exists('$TMUX')
let g:xterm   = &term =~ 'xterm'
