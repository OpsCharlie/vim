return {
  'troydm/zoomwintab.vim',
  event = 'VeryLazy',
  vim.keymap.set("n", "<C-w>z", ":ZoomWinTabToggle<CR>", { silent = true, desc = "Zoom buffer" })
}
