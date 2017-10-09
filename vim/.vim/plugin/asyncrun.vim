" For vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

nmap zqe :AsyncRun<Space>
nmap zqq :AsyncRun!<Space>
nmap ze :AsyncRun -raw<Space>
nmap zq :AsyncRun! -raw<Space>

augroup AsyncRunCOpen
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

augroup AsyncRunLightline
  autocmd!
  autocmd User AsyncRunStart call lightline#update()
  autocmd User AsyncRunStop call lightline#update()
augroup END
