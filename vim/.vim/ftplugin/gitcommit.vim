setlocal spell

" Set cursor to top for gitcommit
au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
