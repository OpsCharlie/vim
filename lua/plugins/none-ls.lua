return {
  "nvimtools/none-ls.nvim",
  lazy = true,
  event = {'BufReadPost', 'BufNewFile'},
  -- keys = {
  --   { "<leader>ff", mode = "n", desc = "LSP Format File" },
  -- },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Python
        -- null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylama,

        -- Shell
        null_ls.builtins.formatting.shellharden,
        -- null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.code_actions.shellcheck,
        -- null_ls.builtins.formatting.beautysh,

        -- JS yaml html markdown
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.jq,

        -- Go
        null_ls.builtins.diagnostics.golangci_lint,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Spelling
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.codespell.with({
          args = { "--builtin", "clear,rare,code", "-" },
        }),
      },
    })
  end,
}
