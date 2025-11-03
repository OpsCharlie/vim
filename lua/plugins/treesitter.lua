 return {
   "nvim-treesitter/nvim-treesitter",
   -- Nvim Treesitter configurations and abstraction layer
   -- dependencies = {
   --   { "nvim-treesitter/nvim-treesitter-context", },
   -- },
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local file_size = vim.fn.getfsize(vim.fn.expand('%'))
    local max_size = vim.g.bigfile_size_limit or (1024 * 1024 * 50)

    if file_size < max_size then
      local config = require("nvim-treesitter.configs")
      config.setup({
         ensure_installed = {
           "bash",
           "desktop",
           "go",
           "json",
           "lua",
           "markdown",
           "markdown_inline",
           "php",
           "powershell",
           "python",
           "yaml",
           "diff",
           "dockerfile",
           "git_config",
           "gitcommit",
           "gitignore",
           "jinja",
           "jinja_inline",
           "terraform",
           "vim",
           "vimdoc",
         },
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
    end
  end,
}
