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
    opts = {
      ensure_installed = {
        "ansible-language-server",
        "bash-debug-adapter",
        "bash-language-server",
        "black",
        "codespell",
        "debugpy",
        "delve",
        "djlint",
        "docker-compose-language-service",
        "golangci-lint",
        "gopls",
        "grammarly-languageserver",
        "jq-lsp",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "php-debug-adapter",
        "powershell-editor-services",
        "prettier",
        "pyright",
        "ruff",
        "shellcheck",
        "shfmt",
        "shellharden",
        "systemd-language-server",
        "systemdlint",
      },
    },
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
