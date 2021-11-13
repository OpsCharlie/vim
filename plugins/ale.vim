Plug 'w0rp/ale'                             " Syntax checker


" Ale settings
let g:ale_disable_lsp = 1
let g:ale_open_list = 1 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'
" let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 5
autocmd QuitPre * if empty(&bt) | lclose | endif

