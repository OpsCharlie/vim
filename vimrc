" Install plugins: :PluginInstall or vim +PluginInstall +qall


" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lilydjwg/colorizer'                   " Colorize all text in the form #rgb,...
Plug 'ConradIrwin/vim-bracketed-paste'      " Set paste when pasting with C-S-v
Plug 'sheerun/vim-polyglot'                 " File type
Plug 'w0rp/ale'                             " Syntax checker
Plug 'scrooloose/nerdtree'                  " A tree explorer
Plug 'scrooloose/nerdcommenter'             " NERD Commenter script
Plug 'tyok/nerdtree-ack'                    " Search function for nerdtree
Plug 'mileszs/ack.vim'                      " Search function dependeny
Plug 'Xuyuanp/nerdtree-git-plugin'          " Git icons plugin for NERDTree
Plug 'vim-airline/vim-airline'              " Status/tabline for vim
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'                   " Git Wrapper
Plug 'christoomey/vim-tmux-navigator'       " Seamless navigation between tmux panes and vim splits
Plug 'dahu/Insertlessly'                    " Inserts space/enter in normal mode
Plug 'ervandew/supertab'                    " Allows you to use <Tab> for all your insert completion
Plug 'jiangmiao/auto-pairs'                 " Insert or delete brackets, parens, quotes in pair
Plug 'dhruvasagar/vim-table-mode'           " Instant table creation
Plug 'airblade/vim-gitgutter'               " Shows a git diff in the sign column
Plug 'SirVer/ultisnips'                     " Snippet solution for Vim
Plug 'phenomenes/ansible-snippets'          " Ansible Vim snippets
Plug 'fatih/vim-nginx'                      " Nginx syntax files
Plug 'c0r73x/vimdir.vim'                    " Manage files and directories in vim
Plug 'WolfgangMehner/bash-support'          " Insert code snippets, run, check, and debug the code
" Plug 'severin-lemaignan/vim-minimap'        " Minimap on the right side <leader>mm  <leader>mc
Plug 'rafi/awesome-vim-colorschemes'        " Collection of colorschemes
"Plug 'qualiabyte/vim-colorstepper'          " Easy change colorscheme F7/F6: next/prev  SHIFT F7: reload
Plug 'pedrohdz/vim-yaml-folds'              " Very simple folding configuration for YAML
Plug 'junegunn/fzf'                         " To set up FZF in Vim
Plug 'junegunn/fzf.vim'                     " To search for files inside Vim
Plug 'troydm/zoomwintab.vim'                " A simple zoom window plugin that uses vim's tabs feature to zoom into a window.
Plug 'junegunn/limelight.vim'               " Hyperfocus-writing in Vim
Plug 'Yggdroot/indentLine'                  " Display thin vertical lines at each indentation level.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' } " This is a vim syntax plugin for Ansible 2.x
Plug 'ryanoasis/vim-devicons'


" Deoplete completion framework  "pip3 install pynvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


" All of your Plugins must be added before the following line
call plug#end()


filetype plugin on  "Enable filetype plugins
filetype indent on

scriptencoding utf-8
set encoding=utf-8

syntax enable       "Enable syntax highlighting
syntax sync minlines=300
set synmaxcol=300

set history=700     " Sets how many lines of history VIM has to remember
set autoread        " Set to auto read when a file is changed from the outside
" set relativenumber  " set numbers
set nofoldenable    " disable folding
set number          " set numbers
set wildmenu        " turnon wildmenu
" set colorcolumn=80,120    " show column 80 and 120 in different color
set wildmode=longest,full " command completion longest common part, then all.
set showcmd         " display incomplete commands
set hlsearch        " Highlight search results
set linespace=0     " stick together (usefull for nfo files)
set ruler           " Always show current position
set mouse=a         " use mouse
set ignorecase      " search case insensitive
set smartcase       " search case insensitive or case sensitive when capital letter is used
set incsearch       " Makes search act like search in modern browsers
set showmatch       " Show matching brackets when text indicator is over them
set expandtab       " Use spaces instead of tabs
set smarttab        " Be smart when using tabs
set shiftwidth=4    " retab 1 tab == 4 spaces
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'"
set tabstop=4       " number of space
set splitbelow      " split under current buffer
set splitright      " split right of current buffer
set ai              " Auto indent
set si              " Smart indent
set wrap            " Wrap lines
set laststatus=2    " Always show the status line
set clipboard=unnamedplus  " use system clipboard
set timeoutlen=500 ttimeoutlen=0    " disable escape timeout
set scrolloff=4     " keep at least 3 lines below or above cursor
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·   " highlight whitespaces, tab...

" only set term when in vim
if has('nvim')
else
    set term=xterm      " for byobu/tmux control arrow keys
endif
" if (has("termguicolors"))
"     set termguicolors
" endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
set t_ut=
set background=light
" colorscheme railscasts
colorscheme OceanicNext
" set background=dark
" colorscheme solarized8
highlight clear SignColumn


" ColorStepper Keys
nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload


" Tmux
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Disable delete trailing space when md files
" Toggles markdown preview
autocmd BufNewFile,BufRead *.md
    \ let g:insertlessly_cleanup_trailing_ws = 0 |
    \ let g:insertlessly_cleanup_all_ws = 0

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


" Set leader to ,
let mapleader = ","

" Zoom/unzoom split
noremap <C-w>z :ZoomWinTabToggle<CR>

" Set path to file location
set autochdir

" Write with sudo
cmap w!! silent w !sudo tee % >/dev/null <CR>:edit!<CR>


" Pretty print
command! PrettyPrintJSON %!jq '.'
command! UnPrettyPrintJSON %!jq -c '.'
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %


" Clear highlight from selection/search
nnoremap <silent> <Esc><Esc> :let @/=""<CR>


" NERDTRee
" Start if no files are selected
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Set toggle
map <C-n> :NERDTreeToggle<CR>
" Close vim when there is only NERDTRee
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = 1

" Go to location of buffer
map <leader>n :NERDTreeFind<cr>

" Show bookmarks
let NERDTreeShowBookmarks=1


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


" Easy tabs
nnoremap <C-S-t> :tabprevious<CR>
nnoremap <C-t>   :tabnext<CR>
inoremap <C-S-t> <Esc>:tabprevious<CR>i
inoremap <C-t>   <Esc>:tabnext<CR>i


" Center search result
nnoremap n nzz
nnoremap N Nzz


" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv


" Restore cursor position when opening file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif


" Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */ansible/hosts set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1

" <leader>gr   goto role under cursor
let g:ansible_goto_role_paths = './roles,../inventories/roles'
function! FindAnsibleRoleUnderCursor()
  if exists("g:ansible_goto_role_paths")
    let l:role_paths = g:ansible_goto_role_paths
  else
    let l:role_paths = "./roles"
  endif
  let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
  let l:found_role_path = findfile(l:tasks_main, l:role_paths)
  if l:found_role_path == ""
    echo l:tasks_main . " not found"
  else
    execute "edit " . fnameescape(l:found_role_path) | silent! lcd %:p:h/.. | NERDTreeCWD
  endif
endfunction
au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
au BufRead,BufNewFile */ansible/*.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>


" Ale settings
let g:ale_open_list = 1 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'
" let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 5

" Close quickfix windows when buffer is closed
autocmd QuitPre * if empty(&bt) | lclose | endif


" Airline settings
let g:airline_theme='luna'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0


" UltiSnip settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"


" Bash-support
let g:BASH_MapLeader  = ','
let g:BASH_Ctrl_j = 'no'


" Gitgutter
set updatetime=500
let g:gitgutter_preview_win_floating = 1


" Deoplete
if v:version > 704
  let g:deoplete#enable_at_startup = 1
  let g:SuperTabDefaultCompletionType = "<c-n>"
endif


" FZF and ripgrep
" Use ff files find
" Use gf to find grep
" When searching use ctrl-X/V/T to open
" Prevent files opening in Nerdtree pane
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  " find git root directory
  let path = system('git rev-parse --show-toplevel | tr -d "\n"')
  if !isdirectory(path)
    let path = expand('%:p:h')
  endif
  exe 'cd' fnameescape(path)
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
nnoremap <silent> ff :call FZFOpen(':Files')<CR>
nnoremap <silent> fg :call FZFOpen(':Rg')<CR>


" Default Limelight Dim
let g:limelight_default_coefficient = 0.7


" spell check on gitcommit
autocmd FileType gitcommit setlocal spell

