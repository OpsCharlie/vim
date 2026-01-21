-- Disabled: replaced by smart-splits.nvim which supports both tmux and kitty
-- To re-enable, set enabled = true
return {
  "christoomey/vim-tmux-navigator",
  enabled = false,
  -- The plugin will allow you to navigate seamlessly between vim and tmux splits
  lazy = true,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
