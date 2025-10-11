return {
  "hedyhli/outline.nvim",
  dependencies = {
    'epheien/outline-treesitter-provider.nvim'
  },
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>tO", "<cmd>Outline<CR>", desc = "Outline" },
  },
  opts = {
    providers = {
      priority = { 'lsp', 'markdown', 'norg', 'treesitter' },
    },
    symbols = {
      filter = {
        sh = { 'String', 'Variable', exclude = true },  -- Exclude String and Variable from sh files
      },
    },
  },
}
