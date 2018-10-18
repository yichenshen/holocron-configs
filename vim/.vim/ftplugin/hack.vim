" Use ALE completion instead of Deoplete
augroup hackautocomplete
  autocmd BufEnter <buffer> let g:ale_completion_enabled = 1
  autocmd BufEnter <buffer> let g:deoplete#enable_at_startup = 0
  autocmd BufEnter <buffer> call deoplete#disable()
  autocmd BufEnter <buffer> call ale#completion#Enable()

  autocmd BufLeave <buffer> let g:deoplete#enable_at_startup = 1
  autocmd BufLeave <buffer> let g:ale_completion_enabled = 0
  autocmd BufLeave <buffer> call deoplete#enable()
  autocmd BufLeave <buffer> call ale#completion#Disable()
augroup END

" ALE message format
let g:ale_echo_msg_format = '[%linter%]% [code]% %s'

" Enable HHAST for linting
let g:ale_linters = { 'hack': ['hack', 'hhast']  }

" show type on hover in a floating bubble
let g:ale_set_balloons = 1
let balloondelay = 250

" Autoformatter
let g:ale_fixers.hack = ['hackfmt']
