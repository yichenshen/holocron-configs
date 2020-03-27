au CursorHold * call AutoSave()
au BufLeave * call AutoSave()
au TabLeave * call AutoSave()
au InsertLeave * call AutoSave()

function AutoSave()
  if &mod && !&readonly && &buftype !=# 'nofile' && @% != "" && filereadable(@%) != 0
    noa w
  endif
endfunction
