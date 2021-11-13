Plug 'scrooloose/nerdtree'                  " A tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin'          " Git icons plugin for NERDTree
Plug 'tyok/nerdtree-ack'                    " Search function for nerdtree


" NERDTree start if no files are selected
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTRee ctrl-n
map <C-n> :NERDTreeToggle<CR>
" Close vim when there is only NERDTRee
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowBookmarks=1
