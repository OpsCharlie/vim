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
Plug 'kyazdani42/nvim-tree.lua'             " File explorer
Plug 'kyazdani42/nvim-web-devicons'

Plug 'mileszs/ack.vim'                      " Search function dependeny
Plug 'vim-airline/vim-airline'              " Status/tabline for vim
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'                   " Git Wrapper
Plug 'christoomey/vim-tmux-navigator'       " Seamless navigation between tmux panes and vim splits
Plug 'dahu/Insertlessly'                    " Inserts space/enter in normal mode
" Plug 'ervandew/supertab'                    " Allows you to use <Tab> for all your insert completion
Plug 'jiangmiao/auto-pairs'                 " Insert or delete brackets, parens, quotes in pair
Plug 'dhruvasagar/vim-table-mode'           " Instant table creation
Plug 'airblade/vim-gitgutter'               " Shows a git diff in the sign column
Plug 'SirVer/ultisnips'                     " Snippet solution for Vim
" Plug 'fatih/vim-nginx'                      " Nginx syntax files
Plug 'WolfgangMehner/bash-support'          " Insert code snippets, run, check, and debug the code
Plug 'rafi/awesome-vim-colorschemes'        " Collection of colorschemes
" Plug 'qualiabyte/vim-colorstepper'          " Easy change colorscheme F7/F6: next/prev  SHIFT F7: reload
Plug 'pedrohdz/vim-yaml-folds'              " Very simple folding configuration for YAML
Plug 'junegunn/fzf'                         " To set up FZF in Vim
Plug 'junegunn/fzf.vim'                     " To search for files inside Vim
Plug 'troydm/zoomwintab.vim'                " A simple zoom window plugin that uses vim's tabs feature to zoom into a window.
Plug 'junegunn/limelight.vim'               " Hyperfocus-writing in Vim
Plug 'Yggdroot/indentLine'                  " Display thin vertical lines at each indentation level.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh --output yaml.snippets --style dictionary --no-description' } " This is a vim syntax plugin for Ansible 2.x
Plug 'folke/which-key.nvim'                 " displays a popup with possible key bindings of the command you started typing
Plug 'kdheepak/lazygit.nvim'                " Plugin for calling lazygit from within neovim
Plug 'gennaro-tedesco/nvim-jqx'
Plug 'kevinhwang91/nvim-hlslens'           " helps you better glance at matched information
Plug 'mogelbrod/vim-jsonpath'
" Plug 'mhinz/vim-startify'
" Plug 'ryanoasis/vim-devicons'

" Deoplete completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }



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
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


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
command! PrettyPrintAnsibleJSON %!ppjson.py|jq '.'
command! UnPrettyPrintJSON %!jq -c '.'
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %


" Clear highlight from selection/search
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>




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
nnoremap <silent> <leader>n i%<BS><BS><BS><BS> \| <ESC>
nnoremap <silent> <leader>N :%s/- name: /- name: %<BS><BS><BS><BS> \| /<CR>
nnoremap <silent> <leader>a biansible.builtin.<ESC>
inoremap <silent> <leader>n %<BS><BS><BS><BS> \|
set colorcolumn=160
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
let g:ale_linters_ignore = {
            \ 'yaml': ['yaml-language-server', 'spectral',  'ansible-language-server'],
            \ }
let g:ale_open_list = 0 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'
" let g:ale_echo_msg_format = '%linter% says %s'
" let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 5
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
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
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
call deoplete#custom#var('file', 'enable_slash_completion', 1)
call deoplete#custom#option({ 'smart_case': v:true })


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


" Auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" Indent line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" spell check on gitcommit
autocmd FileType gitcommit setlocal spell


" Lazy git
nnoremap <silent> <leader>gg :LazyGit<CR>


" Json Path
" Optionally copy path to a named register (* in this case) when calling :JsonPath
let g:jsonpath_register = '*'

" Define mappings for json buffers
au FileType json noremap <buffer> <silent> <leader>j :call jsonpath#echo()<CR>
au FileType json noremap <buffer> <silent> <leader>gj :call jsonpath#goto()<CR>


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


" LUA
lua << EOF
-- Hlslens
require('hlslens').setup()
local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- Which key
require("which-key").setup({
  window = {
    border = "single",
  },
})

-- nvim-tree
vim.g.nvim_tree_auto_ignore_ft = 'startify'
-- following options are the default
require'nvim-web-devicons'.setup()
local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<', api.tree.change_root_to_parent, opts('Up'))

end
require'nvim-tree'.setup({
  on_attach = on_attach,
  disable_netrw       = true,
  hijack_netrw        = true,
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
    side = 'left',
  },
    filters = {
      dotfiles = true,
  },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
EOF