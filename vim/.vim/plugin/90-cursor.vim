function! s:EscapeEscapes(string)
  " double each <Esc>
  return substitute(a:string, "\<Esc>", "\<Esc>\<Esc>", "g")
endfunction

function! s:TmuxWrap(string)
  if strlen(a:string) == 0
    return ""
  end

  let tmux_begin  = "\<Esc>Ptmux;"
  let tmux_end    = "\<Esc>\\"

  return tmux_begin . s:EscapeEscapes(a:string) . tmux_end
endfunction

" change shape of cursor in insert mode in iTerm 2
if g:iterm
  let start_insert  = "\<Esc>]50;CursorShape=1\x7"
  let end_insert    = "\<Esc>]50;CursorShape=0\x7"

  if g:tmux
    let start_insert  = s:TmuxWrap(start_insert)
    let end_insert    = s:TmuxWrap(end_insert)
  endif

  let &t_SI = start_insert
  let &t_EI = end_insert
endif
