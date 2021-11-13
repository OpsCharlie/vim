Plug 'phenomenes/ansible-snippets'          " Ansible Vim snippets


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
" au BufRead,BufNewFile */ansible/*.yml nnoremap K :!ansible-doc <C-R><C-W><CR>

