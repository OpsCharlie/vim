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
    config = function()
      local handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      }
      require("mason-lspconfig").setup({
        handlers = handlers,
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

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "LSP Diagnostic Float" })
      vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, { desc = "LSP Diagnostic List" })
    end,
  },
}
