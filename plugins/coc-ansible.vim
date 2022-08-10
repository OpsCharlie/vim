" coc-ansible
let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }
" enter the mapped key and you will see a list of code actions that can be performed.
nmap <leader>an <Plug>(coc-codeaction-selected)
