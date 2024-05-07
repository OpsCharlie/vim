return {
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
      local lspconfig = require('lspconfig')
      require('mason').setup({})
      require('mason-lspconfig').setup_handlers({
        function(server)
          lspconfig[server].setup({})
        end,
      })
    end,
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
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "LSP Diagnostic Float" })
      vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, { desc = "LSP Diagnostic List" })
      vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "LSP Format File" })
    end,
  },
}
