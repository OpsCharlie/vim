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

    -- Custom sources
    local mbake_format = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "make" },
      generator = null_ls.formatter({
        command = "mbake",
        args = function(params)
          return { "format", params.temp_path }
        end,
        to_temp_file = true,
      }),
    }

    local mbake_diagnostics = {
      method = null_ls.methods.DIAGNOSTICS,
      filetypes = { "make" },
      generator = null_ls.generator({
        command = "mbake",
        args = { "validate", "$FILENAME" },
        from_stderr = true,
        format = "line",
        on_output = function(line)
          -- Try several common formats
          local lnum, msg =
              line:match("^%d+:%s*(.+)$") or
              line:match("^%d+:%s*(.+)$")

          local row, message =
              line:match(":(%d+):%s*(.+)") or
              line:match("^(%d+):%s*(.+)")

          if row and message then
            return {
              row = tonumber(row),
              col = 1,
              message = message,
              severity = vim.diagnostic.severity.ERROR,
              source = "mbake",
            }
          end
        end,
      }),
    }

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

      -- Makefile
      mbake_format,
      mbake_diagnostics,

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
