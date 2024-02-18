return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "yaml" }
        },
        indent = {
          enable = true,
          disable = { "yaml" }
        },
      })
    end,
  },
}
