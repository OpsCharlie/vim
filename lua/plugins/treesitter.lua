return {
  "nvim-treesitter/nvim-treesitter",
  -- Nvim Treesitter configurations and abstraction layer
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      -- Show context of the current function in the top of the screen
      event = { "BufReadPost", "BufNewFile" },
      opts = function()
        return { mode = 'cursor', max_lines = 3 }
      end,
    },
  },
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {},
      sync_install = false,
      ignore_install = {},
      modules = {},
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "yaml" },
      },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      matchup = {
        enable = true,         -- mandatory, false will disable the whole extension
      },
    })
  end,
}
