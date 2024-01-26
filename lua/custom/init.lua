-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.mapleader = ","
vim.o.autochdir = true
vim.o.scrolloff = 4

os.execute('mkdir -p ~/.vim')
os.execute('mkdir -p ~/.vim/backup')
os.execute('mkdir -p ~/.vim/swap')
vim.cmd 'set backupdir=/home/cave/.vim/backup//'
vim.cmd 'set directory=/home/cave/.vim/swap//'

os.execute('mkdir /home/cave/.vim/undo')
vim.cmd 'set undodir=/home/cave/.vim/undo//'
vim.cmd 'set undofile'
vim.cmd 'set undolevels=1000'
vim.cmd 'set undoreload=10000'

vim.opt.listchars = { tab = '» ', extends = '›', precedes = '‹', nbsp = '·' , trail = '·' }
vim.opt.list = true


vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*/ansible/*.yml", "*/ansible/hosts"},
  command = "set filetype=yaml.ansible",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.ansible",
  callback = function()
    vim.keymap.set('n', '<leader>n', 'i%<BS><BS><BS><BS> | <ESC>', { silent = true })
    vim.keymap.set('i', '<leader>n', '%<BS><BS><BS><BS> |', { silent = true })
    vim.keymap.set('n', '<leader>N', ':%s/- name: /- name: %<BS><BS><BS><BS> | /<CR>', { silent = true })
    vim.keymap.set('n', '<leader>a', 'a biansible.builtin.<ESC>', { silent = true })
    vim.opt.colorcolumn = "160"
  end
})

vim.api.nvim_create_user_command('PrettyPrintJSON', '%!jq \'.\'', { desc = "PrettyPrintJSON" })
vim.api.nvim_create_user_command('PrettyPrintAnsibleJSON', '%!ppjson.py|jq \'.\'', { desc = "PrettyPrintAnsibleJSON" })
vim.api.nvim_create_user_command('UnPrettyPrintJSON', '%!jq -c \'.\'', { desc = "UnPrettyPrintJSON" })
vim.api.nvim_create_user_command('PrettyPrintHTML', '!tidy -mi -html -wrap 0 %', { desc = "PrettyPrintHTML" })
vim.api.nvim_create_user_command('PrettyPrintXML', '!tidy -mi -xml -wrap 0 %', { desc = "PrettyPrintXML" })

