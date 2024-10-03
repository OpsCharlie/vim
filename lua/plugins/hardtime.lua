return {
  "m4xshen/hardtime.nvim",
  -- Establish good command workflow and quit bad habit.
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    disable_mouse = false,
    max_count = 5,
    max_time = 100,
    disabled_keys = {
      ["<Up>"] = { "" },
      ["<Down>"] = { "" },
      ["<Left>"] = { "" },
      ["<Right>"] = { "" },
    },
  },
}
