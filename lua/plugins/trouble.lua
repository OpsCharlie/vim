return {
  "folke/trouble.nvim",
  -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  cmd = "Trouble",
  opts = {},
  keys = {
    {
      "<leader>D",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
}
