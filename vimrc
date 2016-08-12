filetype plugin on  "Enable filetype plugins
filetype indent on

syntax enable       "Enable syntax highlighting

set history=700     "Sets how many lines of history VIM has to remember
set autoread        " Set to auto read when a file is changed from the outside
set term=xterm      "for byobu/tmux control arrow keys
set nu              "set numbers
set wildmenu        "turnon wildmenu
set showcmd
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
set tabstop=4       "number of space
"set ai              "Auto indent
"set si              "Smart indent
set wrap            "Wrap lines
set laststatus=2    "Always show the status line
set clipboard=unnamedplus  "use system clipboard
set timeoutlen=500 ttimeoutlen=0    "disable escape timeout



" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE   '
    en
    return ''
endfunction
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l " Format the status line


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


set t_Co=256
colorscheme railscasts


" Put plugins and dictionaries in this dir
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir


execute pathogen#infect()
call pathogen#helptags()


" Keep undo history across sessions by storing it in a file
"if has('persistent_undo')
"    let myUndoDir = expand(vimDir . '/undodir')
"    " Create dirs
"    call system('mkdir ' . vimDir)
"    call system('mkdir ' . myUndoDir)
"    let &undodir = myUndoDir
"    set undofile
"endif


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


"Ansible
let g:ansible_options = {'ignore_blank_lines': 0}

"Syntastic
"au BufNewFile,BufRead *.yml set filetype=ansible
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



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
    \   "vim": '"',
    \   "tex": '%',
    \   "ansible": '#',
    \   "nginx": '#',
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
