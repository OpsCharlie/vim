return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- Plugin to improve viewing Markdown files in Neovim
  lazy = true,
  ft = { "markdown" },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
