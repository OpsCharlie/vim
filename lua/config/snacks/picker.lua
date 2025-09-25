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
  layout = {
    preset = "telescope",
  },
  win = {
    input = {
      keys = {
        ["<Esc>"] = { "close", mode = { "n", "i" } },
        ["/"] = "toggle_focus",
        ["<C-x>"] = { "edit_split", mode = { "i", "n" } },
      },
    },
    list = {
      keys = {
        ["<C-x>"] = { { "pick_win", "edit_split" } },
      },
    },
  },
  sources = {
    explorer = {
      layout = {
        layout = {
          width = 30,
        }
      },
      actions = {
        my_confirm = function(picker, item)
          if item and item.dir then
            picker:action("confirm")
          elseif vim.tbl_count(vim.fn.getbufinfo({ buflisted = true })) == 1 then
            picker:action("confirm")
          else
            picker:action({ "pick_win", "jump" })
          end
        end
      },
      win = {
        list = {
          keys = {
            ["<ESC>"] = false,
            ["<"] = "explorer_up",
            [">"] = "explorer_focus",
            ["<CR>"] = "my_confirm",
            ["<C-x>"] = { { "pick_win", "edit_split" } },
            ["<C-v>"] = { { "pick_win", "edit_vsplit" } },
            ["<C-c>"] = "tcd",
            ["<C-n>"] = "close",
            ["<c-t>"] = "tab",
            ["<leader>/"] = "picker_grep",
          },
        },
      },
    },
  },
}
