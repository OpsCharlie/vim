

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


" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


" Keep undo history across sessions by storing it in a file
augroup LargeFile
  let g:large_file = 10485760 " 10MB
  au BufReadPre *
  \ let f=expand("<afile>") |
  \ if getfsize(f) > g:large_file |
    \ set eventignore+=FileType |
    \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
  \ else |
    \ if has('persistent_undo') |
      \ call system('mkdir ~/.vim/undo') |
      \ set undodir=~/.vim/undo// |
      \ set undofile |
      \ set undolevels=1000 |
      \ set undoreload=10000 |
    \ endif |
  \ endif
augroup END


" set leader to ,
let mapleader = ","


" write with sudo
cmap w!! silent w !sudo tee % >/dev/null <CR>:edit!<CR>


" pretty print
command! PrettyPrintJSON %!jq '.'
command! UnPrettyPrintJSON %!jq -c '.'
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %


" clear highlight from selection/search
nnoremap <silent> <Esc><Esc> :let @/=""<CR>


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


" Maintain the cursor position when yanking a visual selectio
vnoremap y myy`y


" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


" Restore cursor position when opening file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" spell check on gitcommit
autocmd FileType gitcommit setlocal spell


" Install plugins: :PluginInstall or vim +PluginInstall +qall
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug by yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finis_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif


call plug#begin(expand('~/.config/nvim/plugged'))

" source ~/.config/nvim/plugins/ack.vim
" source ~/.config/nvim/plugins/ale.vim
" source ~/.config/nvim/plugins/auto-pairs.vim
" source ~/.config/nvim/plugins/bash-support.vim
" source ~/.config/nvim/plugins/deoplete.vim
" source ~/.config/nvim/plugins/nerdtree.vim
" source ~/.config/nvim/plugins/supertab.vim
" source ~/.config/nvim/plugins/vim-colorstepper.vim
" source ~/.config/nvim/plugins/vim-minimap.vim
" source ~/.config/nvim/plugins/vim-nginx.vim
source ~/.config/nvim/plugins/ansible-snippets.vim
source ~/.config/nvim/plugins/awesome-vim-colorschemes.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/colorizer.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/git.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/insertlessly.vim
source ~/.config/nvim/plugins/limelight.vim
source ~/.config/nvim/plugins/lazygit.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nerdtreecommenter.vim
source ~/.config/nvim/plugins/ultisnips.vim
source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/vim-bracketed-paste.vim
source ~/.config/nvim/plugins/vim-polyglot.vim
source ~/.config/nvim/plugins/vim-rooter.vim
source ~/.config/nvim/plugins/vim-table-mode.vim
source ~/.config/nvim/plugins/vim-tmux-navigator.vim
source ~/.config/nvim/plugins/vim-yaml-folds.vim
" source ~/.config/nvim/plugins/vimdir.vim
source ~/.config/nvim/plugins/zoomwintab.vim
source ~/.config/nvim/plugins/vim-devicons.vim

" All of your Plugins must be added before the following line
call plug#end()


doautocmd User PlugLoaded

let g:gruvbox_italic=1
set bg=dark
color gruvbox
" set background=light
" colorscheme railscasts
" colorscheme OceanicNext
" set background=dark
" colorscheme solarized8
highlight clear SignColumn
