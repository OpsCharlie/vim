return {
  "folke/todo-comments.nvim",
  -- Highlight and list TODO/FIX/HACK/WARN/NOTE comments; integrates with Trouble via `:Trouble todo`
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
  },
}
