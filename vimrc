" Install plugins: :PluginInstall or vim +PluginInstall +qall


" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'roxma/vim-paste-easy'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dahu/Insertlessly'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
" Plug 'vim-scripts/vim-auto-save'
Plug 'dhruvasagar/vim-table-mode'
Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'phenomenes/ansible-snippets'
" Plug 'micahelliott/rocannon'

Plug 'pearofducks/ansible-vim'
" Plug 'chase/vim-ansible-yaml'

Plug 'fatih/vim-nginx'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'vim-vdebug/vdebug'

Plug 'c0r73x/vimdir.vim'
Plug 'WolfgangMehner/bash-support'
" All of your Plugins must be added before the following line
call plug#end()



filetype plugin on  "Enable filetype plugins
filetype indent on

syntax enable       "Enable syntax highlighting

set history=700     "Sets how many lines of history VIM has to remember
set autoread        " Set to auto read when a file is changed from the outside
set term=xterm      "for byobu/tmux control arrow keys
set relativenumber  "set numbers
set number          "set numbers
set wildmenu        "turnon wildmenu
set showcmd         "display incomplete commands
set hlsearch        "Highlight search results
set ruler           "Always show current position
set mouse=a         "use mouse
set ignorecase      "search case insensitive
set smartcase       "search case insensitive or case sensitive when capital letter is used
set incsearch       "Makes search act like search in modern browsers
set showmatch       "Show matching brackets when text indicator is over them
set expandtab       "Use spaces instead of tabs
set smarttab        "Be smart when using tabs
set shiftwidth=4    "retab 1 tab == 4 spaces
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'"
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
"set paste           " disable indent on copy

colorscheme railscasts
highlight LineNr term=bold cterm=none ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE




""" STATUS LINE
""function! HasPaste()
""    if &paste
""        return 'PASTE MODE '
""    en
""    return ''
""endfunction
""
""function! HasTable()
""    if tablemode#IsActive()
""        return 'TABLE MODE '
""    en
""    return ''
""endfunction
""
""" Format the status line
""set statusline=\ %{HasPaste()}   " PASTE mode enabled
""set statusline+=\ %{HasTable()}  " TABLE mode enabled
""set statusline+=%.40F            " file name
""set statusline+=%m%r%h\ %w       " flags
""set statusline+=\ FileType:\ %y  " file type
""set statusline+=%=               " right align
""set statusline+=%c,%l/%L         " column, linenumber/linenumbers
""set statusline+=\ %P             " percent through file



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



"ctrl-c ctrl-v capabilities
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
imap <C-z> <ESC>ui



"write with sudo
cmap w!! w !sudo tee % >/dev/null


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


"Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */ansible/hosts set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1

"Syntastic
" pip install ansible-lint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" ignore: [204] Lines should be no longer than 160 chars
let g:syntastic_ansible_ansible_lint_args = '-x 204,301,305'


""Autosave files when focus is lost
"au FocusLost * silent! wa


"Autosave plugin
"AutoSave is disabled by default, run :AutoSaveToggle to enable/disable it.
let g:auto_save = 0                  " enable AutoSave on Vim startup
"let g:auto_save_no_updatetime = 1    " do not change the 'updatetime' option
"let g:auto_save_in_insert_mode = 0   " do not save while in insert mode
"let g:auto_save_silent = 1           " do not display the auto-save notification
"let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save



" toggle comment with control e
let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "apache": '#',
    \   "vim": '"',
    \   "tex": '%',
    \   "ansible": '#',
    \   "ansible.yaml": '#',
    \   "yaml.ansible": '#',
    \   "ansible_hosts": '#',
    \   "nginx": '#',
    \   "yaml": '#',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
    if getline('.') =~ "^\\s*" . comment_leader . " "
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else
        if getline('.') =~ "^\\s*" . comment_leader
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
        else
            " Comment the line
            execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
        end
    end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <C-e> :call ToggleComment()<cr>
vnoremap <C-e> :call ToggleComment()<cr>


" airline
let g:airline_theme='term'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0

" put quotes around bash variable
nnoremap sq :silent! normal mpea"<Esc>bhi"<Esc>`pl

" put box around comment
let @b='^i# $a #yypVr#yykP'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

let g:BASH_MapLeader  = ','
let g:BASH_Ctrl_j = 'no'
