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
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
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
  {
    "folke/lazydev.nvim",
    -- Useful to load neovim lua environment.
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
