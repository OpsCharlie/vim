return {
    "nvimtools/none-ls.nvim",
    -- bridge that gap and simplify the process of creating, sharing, and setting up LSP sources
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    -- keys = {
    --   { "<leader>ff", mode = "n", desc = "LSP Format File" },
    -- },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Python
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.black,

                -- Shell
                null_ls.builtins.formatting.shfmt,

                -- JS yaml html markdown
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.markdownlint.with({
                  extra_args = { "-c", "~/.config/markdownlint.yaml" },
                }),

                -- Go
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.formatting.gofmt,

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Spelling
                null_ls.builtins.completion.spell,
                -- null_ls.builtins.formatting.codespell,
                null_ls.builtins.diagnostics.codespell.with({
                    args = { "--builtin", "clear,rare,code", "-" },
                }),
            },
        })
    end,
}
