lua require("echo-diagnostics").setup{show_diagnostic_number = false, show_diagnostic_source = true}

" Show error when cursor at line
autocmd CursorHold,CursorMoved * lua require('echo-diagnostics').echo_line_diagnostic()

" Show all errors with gk
nnoremap gk <cmd>lua require("echo-diagnostics").echo_entire_diagnostic()<CR>
