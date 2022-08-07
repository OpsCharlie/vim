vim.api.nvim_exec([[
autocmd FileType gitcommit setlocal spell
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.ejs setfiletype html
au FileType TelescopePrompt setlocal nocursorline
au BufRead,BufNewFile */ansible/*.yml set filetype=maml.ansible
au BufRead,BufNewFile */ansible/hosts set filetype=yaml.ansible
]], true)
