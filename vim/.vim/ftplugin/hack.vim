" ALE message format
let g:ale_echo_msg_format = '[%linter%]% [code]% %s'

" Enable HHAST for linting
let g:ale_linters = { 'hack': ['hack', 'hhast']  }

" show type on hover in a floating bubble
let g:ale_set_balloons = 1
let balloondelay = 250

" Autoformatter
let g:ale_fixers.hack = ['hackfmt']
