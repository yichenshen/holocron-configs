lua << EOF
require('lsp-status').config {
    current_function = false,
    show_filename = false,
    status_symbol = '',
    indicator_ok = '',
    indicator_errors = '',
    indicator_warnings = '',
    indicator_info = '',
    indicator_hint = '',
}
EOF
