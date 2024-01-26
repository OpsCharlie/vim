---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>lg"] = { "<cmd>LazyGit<CR>", "Open lazygit" },
    ["<C-w>z"] = { "<cmd>ZoomWinTabToggle<CR>", "Toggle Zoom Window" },
    ["<CR>"] = { "o<Esc>" },
    ["<space>"] = { "i <Esc>l" },
    ["<C-e>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<cr>" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<cr>" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>" },
    ["<C-t>"] = { "<cmd>tabnext<cr>"},
    ["<C-S-t>"] = { "<cmd>tabprevious<cr>"},
    ["<leader>d"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<C-e>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

-- more keybinds!
M.disabled = {
  n = {
    ["<leader>q"] = "",
  },

  x = {
    ["j"] = "",
    ["k"] = "",
  },
}

return M
