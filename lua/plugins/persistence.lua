return {
  "folke/persistence.nvim",
  -- plugin for automated session management
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("persistence").load() end,                desc = "Session Restore" },
    { "<leader>sS", function() require("persistence").select() end,              desc = "Session Select" },
    { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Session Restore Last Session" },
    { "<leader>sd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
  },
}
