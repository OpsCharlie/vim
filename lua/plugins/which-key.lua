return {
  "folke/which-key.nvim",
  -- WhichKey helps you remember your Neovim keymaps
  lazy = false,
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)", },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      preset = "modern",
      -- window = {
      --   border = "single",      -- none, single, double, shadow
      --   position = "bottom",  -- bottom, top
      --   margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      --   padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      -- },
    })
  end,
}
