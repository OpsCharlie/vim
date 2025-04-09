return {
  {
    "github/copilot.vim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    build = "make tiktoken",
    keys = {
      { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" }
    },
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
