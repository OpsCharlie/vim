return {
  -- LSP config with MASON
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason").setup({})
      require("mason-lspconfig").setup_handlers({
        function(server)
          require("lspconfig")[server].setup({
            capabilities = capabilities,
          })
        end,
      })
      lspconfig.powershell_es.setup({
        filetypes = { "ps1", "psm1", "psd1" },
        bundle_path = "~/.local/share/nvim/mason/packages/powershell-editor-services/",
        settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
        init_options = {
          enableProfileLoading = false,
        },
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "User FilePost",
    config = function()
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      --
      -- local lspconfig = require("lspconfig")
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.html.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.ansiblels.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.bash_ls.setup({
      --   capabilities = capabilities
      -- })
      -- -- lspconfig.jsonls.setup({
      -- --   capabilities = capabilities
      -- -- })
      -- lspconfig.lua_ls.setup({
      --   capabilities = capabilities
      -- })

      vim.diagnostic.config({
        float = {
          header = false,
          border = "rounded",
          focusable = true,
        },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Document" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
      vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "LSP Diagnostic Float" })
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP Code Format File" })
    end,
  },
}
