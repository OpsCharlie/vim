Plug 'tpope/vim-fugitive'                   " Git Wrapper
Plug 'airblade/vim-gitgutter'               " Shows a git diff in the sign column

" gitgutter
set updatetime=500
let g:gitgutter_preview_win_floating = 1
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gc :Git commit<CR>
