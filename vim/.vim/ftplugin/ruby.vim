" vim-autopairs
let b:AutoPairs = {'`': '`', '"': '"', '{': '}', "'": "'", '(': ')', '[': ']', '|': '|'}

" vim-autoformat
let g:formatdef_my_custom_ruby = '"ruby-beautify -c 2 -s".&shiftwidth'
let g:formatters_ruby = ['my_custom_ruby', 'rbeautify']

