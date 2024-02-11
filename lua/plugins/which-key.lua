return {
  "folke/which-key.nvim",
  lazy = true,
  keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function ()
    require("which-key").setup()
  end
}
