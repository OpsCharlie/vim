return {
  "pteroctopus/faster.nvim",
  event = "BufReadPre",
  opts = {
    behaviours = {
      bigfile = {
        on = true,
        limit = vim.g.bigfile_size_limit,
        pattern = "*",
        features_disabled = {
          "illuminate",
          "matchparen",
          "lsp",
          "treesitter",
          "indent_blankline",
          "vimopts",
          "syntax",
          "filetype",
        },
      },
    },
    features = nil,  -- Use defaults (auto-populated)
  },
  config = function(_, opts)
    require("faster").setup(opts)
    local file = vim.fn.expand("%:p")
    local size = vim.fn.getfsize(file) / 1024 / 1024
    if size > vim.g.bigfile_size_limit then
      vim.notify(
        ("Large file optimizations applied: %.2f MiB"):format(size / 1024 / 1024),
        vim.log.levels.WARN,
        { title = "BigFile" }
      )
    end
  end,
}
