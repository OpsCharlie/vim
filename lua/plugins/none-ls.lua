return {
  "nvimtools/none-ls.nvim",
  -- Bridge that gap and simplify the process of creating, sharing, and setting up LSP sources
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local max_size = vim.g.bigfile_size_limit
    local size = vim.fn.getfsize(vim.fn.expand("%"))

    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion

    -- Default sources
    local sources = {
      -- Python
      diagnostics.pylint,
      formatting.black,

      -- Shell
      formatting.shellharden,
      formatting.shfmt.with({
        extra_args = { "-i", "4", "-ci" },
      }),

      -- JS, YAML, HTML, Markdown
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

      -- Spelling
      completion.spell,
      diagnostics.codespell.with({
        args = { "--builtin", "clear,rare,code", "-" },
      }),
    }

    if size > max_size then
      sources = {} -- Disable all null-ls sources
    end

    null_ls.setup({
      sources = sources,
    })
  end,
}
