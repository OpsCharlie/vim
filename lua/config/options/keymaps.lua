-------------------------------------- keymaps ------------------------------------------

vim.keymap.set("n", "<ESC><ESC>", ":nohlsearch<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "<CR>", "i<CR><ESC>", { silent = true, desc = "New line in normal mode" })
vim.keymap.set("n", "<SPACE>", "i <ESC>l", { silent = true, desc = "Add space in normal mode" })
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Indent line" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent line" })
vim.keymap.set("n", "<C-t>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<C-S-t>", ":tabprevious<CR>", { silent = true })
vim.keymap.set("i", "<C-t>", "<ESC>:tabnext<CR>i", { silent = true })
vim.keymap.set("i", "<C-S-t>", "<ESC>:tabprevious<CR>i", { silent = true })
vim.keymap.set("n", "<C-S-n>", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "n", "nzz", { desc = "Center search result" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center search result" })
vim.keymap.set("n", "<leader>n", ":exec &nu==&rnu? 'se nu!' : 'se rnu!'<CR>", { desc = "Toggle numbers" })

vim.keymap.set("n", "dm", function()
  local current_line = vim.fn.line('.')
  local marks = vim.fn.getmarklist(vim.fn.bufnr())
  local marks_to_delete = {}
  for _, mark in ipairs(marks) do
    if mark.pos and mark.pos[2] == current_line then
      local mark_name = mark.mark:sub(2, 2)
      if mark_name:match("[a-zA-Z]") then
        table.insert(marks_to_delete, mark_name)
      end
    end
  end
  if #marks_to_delete > 0 then
    vim.cmd("delmarks " .. table.concat(marks_to_delete, " "))
  end
end, { desc = "Delete mark on current line" })
