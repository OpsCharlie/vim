return {
  {
    "mason-org/mason.nvim",
    -- Neovim package manager for LSP servers, DAP servers, linters, and formatters.
    lazy = true,
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    -- Integration between Mason and nvim-lspconfig.
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "FileType" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      automatic_enable = true,
    },
    config = function(_, opts)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      vim.lsp.config("ansiblels", {
        filetypes = { "ansible" },
      })

      require("mason-lspconfig").setup(opts)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- Automatically install and manage LSP servers, DAP servers, linters, and formatters.
    lazy = true,
    -- event = { "BufReadPost", "BufNewFile", "FileType" },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    dependencies = { "mason-org/mason.nvim" },
    opts = require("config.mason"),
  },
}
