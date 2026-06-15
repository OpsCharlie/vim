return {
  {
    "github/copilot.vim",
    -- GitHub Copilot for Vim
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    config = function()
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    -- Brings GitHub Copilot Chat capabilities directly into your editor
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
      -- { "nvim-telescope/telescope.nvim" },
    },
    build = "make tiktoken",
    keys = {
      { "<leader>tc", ":CopilotChatToggle<CR>", desc = "Copilot Chat" },
      {
        "<leader>gc",
        function()
          require("CopilotChat").open({
            window = {
              layout = "float",
            },
          })
          vim.schedule(function()
            require("CopilotChat").ask("/Commit")
          end)
        end,
        desc = "Commit message (CopilotChat)",
      },
      {
        "<leader>cp",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>cq",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input and input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "x" },
      },
    },
    opts = {
      model = "claude-sonnet-4.6",
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
}
