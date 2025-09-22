return {
  enabled = true,
  icons = {
    git = {
      enabled = true,
      staged = "✓",
      added = "+",
      deleted = "✗",
      modified = "~",
      renamed = "➜",
      untracked = "?",
      ignored = "◌",
      unmerged = "‼",
    },
  },
  sources = {
    explorer = {
      layout = {
        layout = {
          width = 30,
        }
      },
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
