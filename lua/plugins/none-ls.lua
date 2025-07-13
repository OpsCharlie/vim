return {
  "nvimtools/none-ls.nvim",
  -- Bridge that gap and simplify the process of creating, sharing, and setting up LSP sources
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  -- keys = {
  --   { "<leader>ff", mode = "n", desc = "LSP Format File" },
  -- },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    null_ls.setup({
      sources = {
        -- Python
        diagnostics.pylint,
        formatting.black,

        -- Shell
        formatting.shfmt,

        -- JS yaml html markdown
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.markdownlint.with({
          extra_args = { "-c", "~/.config/markdownlint.yaml" },
        }),

        -- Go
        diagnostics.golangci_lint.with({
          command = "golangci-lint",
          args = { "run", "--out-format", "json", "--path-prefix", "$ROOT" },
          timeout = 5000,
        }),
        diagnostics.djlint,
        formatting.gofmt,

        -- Lua
        -- formatting.stylua,

        -- Spelling
        completion.spell,
        -- null_ls.builtins.formatting.codespell,
        diagnostics.codespell.with({
          args = { "--builtin", "clear,rare,code", "-" },
        }),
      },
    })
  end,
}
