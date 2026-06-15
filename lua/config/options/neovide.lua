-------------------------------------- Neovide scaling ------------------------------------------
if vim.g.neovide == true then
  vim.keymap.set("n", "<C-+>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, { silent = true })
  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end, { silent = true })
  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = 1
  end, { silent = true })
end
