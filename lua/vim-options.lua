local opt = vim.opt
local g = vim.g

g.mapleader = ","

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.listchars = { tab = "» ", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }
opt.list = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.autochdir = true
opt.scrolloff = 4

-- Numbers
opt.number = true
-- opt.numberwidth = 2
-- opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>")

-- persistant undo
os.execute("mkdir -p ~/.vim")
os.execute("mkdir -p ~/.vim/backup")
os.execute("mkdir -p ~/.vim/swap")
vim.cmd("set backupdir=/home/$USER/.vim/backup//")
vim.cmd("set directory=/home/$USER/.vim/swap//")

os.execute("mkdir /home/$USER/.vim/undo")
vim.cmd("set undodir=/home/$USER/.vim/undo//")
vim.cmd("set undofile")
vim.cmd("set undolevels=1000")
vim.cmd("set undoreload=10000")

vim.keymap.set("n", "<ESC><ESC>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<CR>", "i<CR><ESC>", { silent = true })
vim.keymap.set("n", "<SPACE>", "i <ESC>l", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Indent line" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent line" })
-- vim.wo.number = true

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*/ansible/*.yml", "*/ansible/hosts" },
  command = "set filetype=yaml.ansible",
})

autocmd("FileType", {
  pattern = "yaml.ansible",
  callback = function()
    vim.keymap.set("n", "<leader>n", "i%<BS><BS><BS><BS> | <ESC>", { silent = true })
    vim.keymap.set("i", "<leader>n", "%<BS><BS><BS><BS> |", { silent = true })
    vim.keymap.set("n", "<leader>N", ":%s/- name: /- name: %<BS><BS><BS><BS> | /<CR>", { silent = true })
    vim.keymap.set("n", "<leader>a", "biansible.builtin.<ESC>", { silent = true })
    vim.opt.colorcolumn = "160"
  end,
})

-------------------------------------- user commands ------------------------------------------
local user_command = vim.api.nvim_create_user_command
user_command("PrettyPrintJSON", "%!jq '.'", { desc = "PrettyPrintJSON" })
user_command("PrettyPrintAnsibleJSON", "%!ppjson.py|jq '.'", { desc = "PrettyPrintAnsibleJSON" })
user_command("UnPrettyPrintJSON", "%!jq -c '.'", { desc = "UnPrettyPrintJSON" })
user_command("PrettyPrintHTML", "!tidy -mi -html -wrap 0 %", { desc = "PrettyPrintHTML" })
user_command("PrettyPrintXML", "!tidy -mi -xml -wrap 0 %", { desc = "PrettyPrintXML" })