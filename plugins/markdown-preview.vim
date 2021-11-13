Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" Disable delete trailing space when md files
" Toggles markdown preview
autocmd BufNewFile,BufRead *.md
    \ let g:insertlessly_cleanup_trailing_ws = 0 |
    \ let g:insertlessly_cleanup_all_ws = 0

