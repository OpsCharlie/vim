Plug 'junegunn/fzf'                         " To set up FZF in Vim
Plug 'junegunn/fzf.vim'                     " To search for files inside Vim

let g:fzf_colors = { 'border':      ['fg', 'Comment'] }

" FZF and ripgrep
" Use ff files find
" Use gf files grep
" Use <leader>af files find ansible dir
" Use <leader>af files grep ansible dir
" When searching use ctrl-X/V/T to open
" Prevent files opening in Nerdtree pane
function! FZFOpenAnsible(command_str)
  if (expand('%') =~# 'Coc Explorer' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  silent! lcd ~/ansible/lxd/roles
  exe 'normal! ' . a:command_str . "\<cr>"
  silent! lcd %:p:h
endfunction

function! FZFOpen(command_str)
  if (expand('%') =~# 'Coc Explorer' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction


nnoremap <silent> <leader>f :call FZFOpen(':Files')<CR>
nnoremap <silent> <leader>r :call FZFOpen(':Rg')<CR>
nmap <Leader>af :call FZFOpenAnsible(':Files')<CR>
nmap <Leader>ag :call FZFOpenAnsible(':Rg')<CR>

