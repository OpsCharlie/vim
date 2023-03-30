" Install plugins: :PluginInstall or vim +PluginInstall +qall


" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
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
" Plug 'lilydjwg/colorizer'                   " Colorize all text in the form #rgb,...
Plug 'ConradIrwin/vim-bracketed-paste'      " Set paste when pasting with C-S-v
Plug 'sheerun/vim-polyglot'                 " File type
Plug 'w0rp/ale'                             " Syntax checker
Plug 'scrooloose/nerdcommenter'             " NERD Commenter script
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'mileszs/ack.vim'                      " Search function dependeny
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
Plug 'fatih/vim-nginx'                      " Nginx syntax files
Plug 'WolfgangMehner/bash-support'          " Insert code snippets, run, check, and debug the code
Plug 'rafi/awesome-vim-colorschemes'        " Collection of colorschemes
Plug 'qualiabyte/vim-colorstepper'          " Easy change colorscheme F7/F6: next/prev  SHIFT F7: reload
Plug 'pedrohdz/vim-yaml-folds'              " Very simple folding configuration for YAML
Plug 'junegunn/fzf'                         " To set up FZF in Vim
Plug 'junegunn/fzf.vim'                     " To search for files inside Vim
Plug 'troydm/zoomwintab.vim'                " A simple zoom window plugin that uses vim's tabs feature to zoom into a window.
Plug 'junegunn/limelight.vim'               " Hyperfocus-writing in Vim
Plug 'Yggdroot/indentLine'                  " Display thin vertical lines at each indentation level.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh --output yaml.snippets --style dictionary --no-description' } " This is a vim syntax plugin for Ansible 2.x
Plug 'folke/which-key.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'gennaro-tedesco/nvim-jqx'
Plug 'kevinhwang91/nvim-hlslens'           " helps you better glance at matched information
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
" Deoplete completion framework
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

set nocompatible
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
" set background=light
" colorscheme railscasts
" set background=dark
" colorscheme gruvbox
set background=light
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
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>


" nvim-tree
lua << EOF
vim.g.nvim_tree_auto_ignore_ft = 'startify'
-- following options are the default
require'nvim-web-devicons'.setup()
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = { enable = false, },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 40,
    height = 30,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        { key = "C", action = "cd" },
        { key = ">", action = "cd" },
        { key = "<", action = "dir_up" },
      }
    }
  },
    filters = {
    dotfiles = true,
  },
}
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
EOF


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
let g:ansible_goto_role_paths = './roles,../roles'
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
    execute "edit " . fnameescape(l:found_role_path) | silent! lcd %:p:h/..
endif
endfunction
au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>


" Ale settings
let g:ale_open_list = 0 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'
" let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 5
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
" open diagnostic list
nnoremap <silent> <leader>d :lopen<CR>

" Close quickfix windows when buffer is closed
autocmd QuitPre * if empty(&bt) | lclose | endif


" Airline settings
let g:airline_theme='luna'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1


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
  if (expand('%') =~# 'fern' && winnr('$') > 1)
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
nnoremap <silent> <leader>f :call FZFOpen(':Files')<CR>
nnoremap <silent> <leader>r :call FZFOpen(':Rg')<CR>
nnoremap <silent> <leader>b :Buffers<CR>
let g:fzf_buffers_jump = 1


" Default Limelight Dim
let g:limelight_default_coefficient = 0.7


" spell check on gitcommit
autocmd FileType gitcommit setlocal spell


" Which key
lua << EOF
require("which-key").setup({
  window = {
    border = "single",
  },
})
EOF


" Lazy git
nnoremap <silent> <leader>gg :LazyGit<CR>


" Hlslens
lua << EOF
local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
EOF


" Startify
let g:startify_files_number = 8
" let g:startify_session_autoload = 1
let g:startify_padding_left = 4
let g:webdevicons_enable_startify = 1
let g:startify_session_delete_buffers = 1 " delete all buffers when loading or closing a session, ignore unsaved buffers
let g:startify_session_remove_lines = ['setlocal', 'winheight'] " lines matching any of the patterns in this list, will be removed from the session file
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
let g:startify_update_oldfiles = 1
let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
let g:startify_fortune_use_unicode = 1 " beautiful symbols
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time"
let g:startify_bookmarks = [
      \ {'a': '~/ansible/lxd/'},
      \ {'r': '~/ansible/lxd/roles/'},
      \ {'t': '~/.tmux/'},
      \ {'v': '~/.vimrc'},
      \ {'b': '~/.bashrc'}
      \ ]
let g:startify_custom_header = [
      \' ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗',
      \' ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝',
      \' ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗  ',
      \' ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝  ',
      \' ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗',
      \' ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝',
      \ ]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ["  Bookmarks"]      },
      \ { 'type': 'files',     'header': ["  MRU Files"]            },
      \ { 'type': 'dir',       'header': ["  MRU Files in ". getcwd()] },
      \ { 'type': 'commands',  'header': ["  Commands"]       },
      \ ]

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
