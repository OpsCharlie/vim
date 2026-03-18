return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    version = false,
    build = ":TSUpdate",
    config = function()
      local file_size = vim.fn.getfsize(vim.fn.expand('%'))
      local max_size = vim.g.bigfile_size_limit or (1024 * 1024 * 50)

      if file_size < max_size then
        local config = require("config.treesitter")
        require("nvim-treesitter.install").compilers = { "gcc", "clang" }

        require("nvim-treesitter").setup({
          highlight = config.highlight,
          indent = config.indent,
        })

        vim.defer_fn(function()
          require("nvim-treesitter").install(config.parsers)
        end, 0)
      end
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = true,
  --   event = { "BufReadPost", "BufNewFile" },
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   opts = {
  --     enable = true,
  --     max_lines = 3,
  --     trim_scope = "outer",
  --   },
  -- },
}
