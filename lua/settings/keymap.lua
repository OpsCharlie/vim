vim.g.mapleader = ","
vim.keymap.set('n', '<F6>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<F6>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- Buffers
vim.keymap.set('n', '<leader>bn', '<Plug>(cokeline-focus-next)', {noremap = false, silent = false})
vim.keymap.set('n', '<leader>bp', '<Plug>(cokeline-focus-prev)', {noremap = false, silent = false})
for i = 1,9 do
  vim.keymap.set('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
end
-- Git
vim.keymap.set('n', '<leader>gf', ':20G<CR>', {noremap = false, silent = false})
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {noremap = false, silent = false})
-- Ctrlsf
vim.keymap.set('n', '<C-S>f', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})
vim.keymap.set('v', '<C-S>f', '<Plug>CtrlSFVwordExec', {noremap = false, silent = false})
vim.keymap.set('n', '<C-S>n', '<Plug>CtrlSFCwordExec', {noremap = false, silent = false})
vim.keymap.set('n', '<C-S>t', ':CtrlSFToggle<CR>', {noremap = true, silent = false})
-- Easy-align
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false}) 
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false}) -- Lightspeed
-- Telescope
vim.keymap.set('n', '<leader>r', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>#', ":lua require('telescope.builtin').grep_string()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>t', ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>b', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>f', ":lua require('plugins.telescope').project_files()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>p', ":lua require'telescope'.extensions.repo.list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%.asdf/', '/%.zinit/', '/%.tmux/'}}<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>g', ":lua require('plugins.telescope').my_git_status()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>ns', ":lua require('plugins.telescope').my_note()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>nn', ":lua NewNote()<CR>", {noremap = true, silent = false})
vim.keymap.set('n', '<leader>n', ":lua require('plugins.scratches').open_scratch_file_floating()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>ll', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('GREP -> ') })<CR>", {noremap = true, silent = true})
-- HlsLens
vim.keymap.set('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- Todo-comments
vim.keymap.set('n', '<leader>to', ':TodoTelescope<CR>', {noremap = true, silent = false})
-- Move.nvim
vim.keymap.set('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<A-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-t>', ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')
-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
-- Comment
vim.keymap.set("n", "<C-e>", "<Plug>(comment_toggle_current_linewise)")
vim.keymap.set("x", "<C-e>", "<Plug>(comment_toggle_linewise_visual)")
-- VimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})


vim.keymap.set('n', '<C-w>z', ':FocusMaxOrEqual<CR>')

