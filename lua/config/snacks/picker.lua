return {
  enabled = true,
  sources = {
    explorer = {
      win = {
        list = {
          keys = {
            ["<ESC>"] = false,
            ["<"] = "explorer_up",
            [">"] = "explorer_focus",
            ["<C-x>"] = { { "pick_win", "edit_split" } },
            ["<C-v>"] = { { "pick_win", "edit_vsplit" } },
            ["<C-c>"] = "tcd",
            ["<leader>/"] = "picker_grep",
            ["<c-t>"] = "terminal",
          },
        },
      },
    },
  },
}
