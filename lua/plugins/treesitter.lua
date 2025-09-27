return {
  "nvim-treesitter/nvim-treesitter",
  -- Nvim Treesitter configurations and abstraction layer
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      -- Show context of the current function in the top of the screen
      event = { "BufReadPost", "BufNewFile" },
      opts = function()
        return { mode = "cursor", max_lines = 3 }
      end,
    },
  },
  branch = "main",
  version = false,            -- last release is way too old and doesn't work on Windows
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function()
    local file_size = vim.fn.getfsize(vim.fn.expand("%"))
    local max_size = vim.g.bigfile_size_limit or (1024 * 1024 * 50)

    if file_size < max_size then
      local config = require("nvim-treesitter.config")
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
          enable = true, -- mandatory, false will disable the whole extension
        },
      })
    end
  end,
}
