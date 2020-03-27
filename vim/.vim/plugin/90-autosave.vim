au CursorHold * call AutoSave()
au BufLeave * call AutoSave()
au TabLeave * call AutoSave()
au InsertLeave * call AutoSave()

function AutoSave()
  if &buftype !=# 'nofile'
    noa w
  endif
endfunction
