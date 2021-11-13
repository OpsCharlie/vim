Plug 'scrooloose/nerdcommenter'             " NERD Commenter script

" NERDTree Commenter
" ,cc       Comment out the current line or text selected in visual mode
" ,c<space> Toggles the comment state of the selected line(s)
" ,cu       Uncomments the selected line(s)
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
set commentstring=#\ %s

" C-e to toggle comment
nmap <C-e> <leader>c<space>
vmap <C-e> <leader>c<space>
