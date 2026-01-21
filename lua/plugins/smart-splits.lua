return {
  "mrjones2014/smart-splits.nvim",
  -- Seamless navigation between nvim and tmux/kitty/wezterm panes
  lazy = false,
  build = "./kitty/install-kittens.bash",
  config = function()
    local smart_splits = require("smart-splits")

    smart_splits.setup({
      -- Ignored filetypes (only while determining if cursor is at edge)
      ignored_filetypes = { "NvimTree", "neo-tree", "DiffviewFiles" },
      -- Ignored buffer types (only while determining if cursor is at edge)
      ignored_buftypes = { "nofile", "quickfix", "prompt" },
      -- Default amount for resize commands
      default_amount = 3,
      -- whether to wrap to opposite side when cursor is at edge
      at_edge = "wrap",
      -- Multiplexer integration - auto-detects tmux, kitty, wezterm
      multiplexer_integration = nil, -- auto-detect
      -- Disable multiplexer navigation when zoomed (tmux)
      disable_multiplexer_nav_when_zoomed = true,
      -- Supply a kitty remote control password if needed
      kitty_password = nil,
    })

    -- Navigation keymaps
    vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left, { desc = "Move to left pane" })
    vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down, { desc = "Move to lower pane" })
    vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up, { desc = "Move to upper pane" })
    vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right, { desc = "Move to right pane" })
    vim.keymap.set("n", "<C-\\>", smart_splits.move_cursor_previous, { desc = "Move to previous pane" })

    -- Resizing keymaps
    vim.keymap.set("n", "<A-h>", smart_splits.resize_left, { desc = "Resize left" })
    vim.keymap.set("n", "<A-j>", smart_splits.resize_down, { desc = "Resize down" })
    vim.keymap.set("n", "<A-k>", smart_splits.resize_up, { desc = "Resize up" })
    vim.keymap.set("n", "<A-l>", smart_splits.resize_right, { desc = "Resize right" })

    -- Swapping buffers keymaps
    vim.keymap.set("n", "<leader><leader>h", smart_splits.swap_buf_left, { desc = "Swap buffer left" })
    vim.keymap.set("n", "<leader><leader>j", smart_splits.swap_buf_down, { desc = "Swap buffer down" })
    vim.keymap.set("n", "<leader><leader>k", smart_splits.swap_buf_up, { desc = "Swap buffer up" })
    vim.keymap.set("n", "<leader><leader>l", smart_splits.swap_buf_right, { desc = "Swap buffer right" })
  end,
}
