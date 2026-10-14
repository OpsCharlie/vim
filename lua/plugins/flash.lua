return {
  "folke/flash.nvim",
  -- Jump to any visible word/char with 2-key labels, plus enhanced f/t/F/T
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,             desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,       desc = "Flash Treesitter" },
    { "r", mode = "o",               function() require("flash").remote() end,           desc = "Remote Flash" },
    { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },       function() require("flash").toggle() end,           desc = "Toggle Flash Search" },
  },
}
