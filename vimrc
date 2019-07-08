" Install plugins: :PluginInstall or vim +PluginInstall +qall


" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lilydjwg/colorizer'                   "Colorize all text in the form #rgb,...
Plug 'ConradIrwin/vim-bracketed-paste'      "Set paste when pasting with C-S-v
Plug 'sheerun/vim-polyglot'                 "File type
"Plug 'vim-syntastic/syntastic'              "Syntax checker
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'                  "A tree explorer
Plug 'scrooloose/nerdcommenter'             "NERD Commenter script
Plug 'tyok/nerdtree-ack'                    "Search function for nerdtree
Plug 'mileszs/ack.vim'                      "Search function dependeny
Plug 'Xuyuanp/nerdtree-git-plugin'          "Git plugin for NERDTree
Plug 'vim-airline/vim-airline'              "Status/tabline for vim
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'                   "Git Wrapper
Plug 'christoomey/vim-tmux-navigator'       "Seamless navigation between tmux panes and vim splits
Plug 'dahu/Insertlessly'                    "Inserts space/enter in norma mode
Plug 'ervandew/supertab'                    "Allows you to use <Tab> for all your insert completion
Plug 'jiangmiao/auto-pairs'                 "Insert or delete brackets, parens, quotes in pair
" Plug 'vim-scripts/vim-auto-save'            "Automatically save changes to disk
Plug 'dhruvasagar/vim-table-mode'           "Instant table creation
Plug 'airblade/vim-gitgutter'               "Shows a git diff in the sign column

Plug 'SirVer/ultisnips'                     "Snippet solution for Vim
Plug 'phenomenes/ansible-snippets'          "Ansible Vim snippets
" Plug 'micahelliott/rocannon'                "Vim for Ansible playbooks
" Plug 'pearofducks/ansible-vim'              "Syntax highlighting Ansible's common filetypes

Plug 'fatih/vim-nginx'                      "Nginx syntax files

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "A code-completion engine for Vim

" Deoplete completion framework  "pip3 install pynvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'c0r73x/vimdir.vim'                    "Manage files and directories in vim
Plug 'WolfgangMehner/bash-support'          "Insert code snippets, run, check, and debug the code

" All of your Plugins must be added before the following line
call plug#end()



filetype plugin on  "Enable filetype plugins
filetype indent on

syntax enable       "Enable syntax highlighting
syntax sync minlines=300
set synmaxcol=300

set history=700     "Sets how many lines of history VIM has to remember
set autoread        "Set to auto read when a file is changed from the outside
set term=xterm      "for byobu/tmux control arrow keys
set relativenumber  "set numbers
set number          "set numbers
set wildmenu        "turnon wildmenu
" set colorcolumn=80,120    " show column 80 and 120 in different color
set wildmode=longest,full " command completion longest common part, then all.
set showcmd         "display incomplete commands
set hlsearch        "Highlight search results
set linespace=0     " stick together (usefull for nfo files)
set ruler           "Always show current position
set mouse=a         "use mouse
set ignorecase      "search case insensitive
set smartcase       "search case insensitive or case sensitive when capital letter is used
set incsearch       "Makes search act like search in modern browsers
set showmatch       "Show matching brackets when text indicator is over them
set expandtab       "Use spaces instead of tabs
set smarttab        "Be smart when using tabs
set shiftwidth=4    "retab 1 tab == 4 spaces
set shiftround      "use multiple of shiftwidth when indenting with '<' and '>'"
set tabstop=4       "number of space
"set ai              "Auto indent
"set si              "Smart indent
set wrap            "Wrap lines
set laststatus=2    "Always show the status line
set clipboard=unnamedplus  "use system clipboard
set timeoutlen=500 ttimeoutlen=0    "disable escape timeout
set scrolloff=4     " keep at least 3 lines below or above cursor
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·   "highlight whitespaces
set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

colorscheme railscasts
" highlight LineNr term=bold cterm=none ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight clear SignColumn



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

" set leader to ,
let mapleader = ","


"ctrl-c ctrl-v capabilities
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
imap <C-z> <ESC>ui



"write with sudo
cmap w!! silent w !sudo tee % >/dev/null <CR>:edit!<CR>



"clear highlight from selection/search
nnoremap <silent> <Esc><Esc> :let @/=""<CR>



"NERDTree start if no files are selected
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"NERDTRee ctrl-n
map <C-n> :NERDTreeToggle<CR>



"Easy tabs
nnoremap <C-S-t> :tabprevious<CR>
nnoremap <C-t>   :tabnext<CR>
inoremap <C-S-t> <Esc>:tabprevious<CR>i
inoremap <C-t>   <Esc>:tabnext<CR>i

"Easy buffers
" nnoremap <C-S-b> :bprevious<CR>
" nnoremap <C-b>   :bnext<CR>
" inoremap <C-S-b> <Esc>:bprevious<CR>i
" inoremap <C-b>   <Esc>:bnext<CR>i

"Easy moving windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"Center search result
nnoremap n nzz
nnoremap N Nzz



"Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv



"Reload .vimtc file on saving
autocmd BufWritePost $MYVIMRC source $MYVIMRC



"Restore cursor position when opening file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif


"Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */ansible/hosts set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1

"Syntastic
" pip install ansible-lint
"""set statusline+=%#warningmsg#
"""set statusline+=%{SyntasticStatuslineFlag()}
"""set statusline+=%*
"""let g:syntastic_always_populate_loc_list = 1
"""let g:syntastic_auto_loc_list = 1
"""let g:syntastic_check_on_open = 0
"""let g:syntastic_check_on_wq = 0
"""let g:syntastic_error_symbol = "✗"
"""let g:syntastic_warning_symbol = "⚠"
"""" ignore: [204] Lines should be no longer than 160 chars
"""let g:syntastic_ansible_ansible_lint_args = '-x 204,301,305'


" Ale settings
let g:ale_open_list = 1 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 5

""Autosave files when focus is lost
"au FocusLost * silent! wa


"Autosave plugin
"AutoSave is disabled by default, run :AutoSaveToggle to enable/disable it.
let g:auto_save = 0                  " enable AutoSave on Vim startup
"let g:auto_save_no_updatetime = 1    " do not change the 'updatetime' option
"let g:auto_save_in_insert_mode = 0   " do not save while in insert mode
"let g:auto_save_silent = 1           " do not display the auto-save notification
"let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save



"" toggle comment with control e
"let s:comment_map = {
"    \   "c": '\/\/',
"    \   "cpp": '\/\/',
"    \   "go": '\/\/',
"    \   "java": '\/\/',
"    \   "javascript": '\/\/',
"    \   "scala": '\/\/',
"    \   "php": '\/\/',
"    \   "python": '#',
"    \   "ruby": '#',
"    \   "sh": '#',
"    \   "desktop": '#',
"    \   "fstab": '#',
"    \   "conf": '#',
"    \   "profile": '#',
"    \   "bashrc": '#',
"    \   "bash_profile": '#',
"    \   "mail": '>',
"    \   "eml": '>',
"    \   "bat": 'REM',
"    \   "ahk": ';',
"    \   "apache": '#',
"    \   "vim": '"',
"    \   "tex": '%',
"    \   "ansible": '#',
"    \   "ansible.yaml": '#',
"    \   "yaml.ansible": '#',
"    \   "ansible_hosts": '#',
"    \   "nginx": '#',
"    \   "yaml": '#',
"    \ }
"
"function! ToggleComment()
"    if has_key(s:comment_map, &filetype)
"        let comment_leader = s:comment_map[&filetype]
"    if getline('.') =~ "^\\s*" . comment_leader . " "
"        " Uncomment the line
"        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
"    else
"        if getline('.') =~ "^\\s*" . comment_leader
"            " Uncomment the line
"            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
"        else
"            " Comment the line
"            execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
"        end
"    end
"    else
"        echo "No comment leader found for filetype"
"    end
"endfunction
"
"nnoremap <C-e> :call ToggleComment()<cr>
"vnoremap <C-e> :call ToggleComment()<cr>


" airline
let g:airline_theme='luna'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0


" put quotes around bash variable
nnoremap sq :silent! normal mpea"<Esc>bhi"<Esc>`pl


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

let g:BASH_MapLeader  = ','
let g:BASH_Ctrl_j = 'no'

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"


" NERDTree Commenter
" ,cc       Comment out the current line or text selected in visual mode
" ,c<space> Toggles the comment state of the selected line(s)
" ,cu       Uncomments the selected line(s)
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

