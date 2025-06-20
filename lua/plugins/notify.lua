return {
  "rcarriga/nvim-notify",
  -- A fancy, configurable, notification manager for NeoVim
  config = function()
    require("notify").setup({
      stages = "fade",
      -- background_colour = "FloatShadow",
      timeout = 3000,
      merge_duplicates = true,
    })
    vim.notify = require("notify")
  end,
}
