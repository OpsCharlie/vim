return {
  'troydm/zoomwintab.vim',
  lazy = true,
  keys = { "<C-w>z", mode = { "n", "v" }, desc = "Toggle zoom" },
  vim.keymap.set("n", "<C-w>z", ":ZoomWinTabToggle<CR>", { silent = true, desc = "Zoom buffer" })
}
