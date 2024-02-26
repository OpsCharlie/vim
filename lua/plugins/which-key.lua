return {
  "folke/which-key.nvim",
  lazy = true,
  keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g", "z" },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      window = {
        border = "single",      -- none, single, double, shadow
        position = "bottom",  -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      },
    })
  end,
}
