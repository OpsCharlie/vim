return {
  "j-hui/fidget.nvim",
  -- Extensible UI for Neovim notifications and LSP progress messages.
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    notifications = {
      override_vim_notify =true,
    },
  },
}
