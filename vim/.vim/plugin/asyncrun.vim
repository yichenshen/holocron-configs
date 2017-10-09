" For vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

nmap ze :AsyncRun<Space>
nmap zq :AsyncRun!<Space>
nmap zre :AsyncRun -raw<Space>
nmap zrq :AsyncRun! -raw<Space>

augroup AsyncRunCOpen
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

augroup AsyncRunLightline
  autocmd!
  autocmd User AsyncRunStart call lightline#update()
  autocmd User AsyncRunStop call lightline#update()
augroup END
