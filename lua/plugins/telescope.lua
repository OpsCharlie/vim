return {
  "nvim-telescope/telescope.nvim",
  -- A highly extendable fuzzy finder over lists
  dependencies = {
    "nvim-lua/plenary.nvim",                    -- A collection of Lua functions used by many Neovim plugins
    "nvim-telescope/telescope-fzy-native.nvim", -- A telescope extension for fuzzy finding with fzy algorithm
    "davvid/telescope-git-grep.nvim",           -- A telescope extension for searching git repositories
    "gbrlsnchs/telescope-lsp-handlers.nvim",    -- A telescope extension for LSP handlers
    {
      "benfowler/telescope-luasnip.nvim",
      module = "telescope._extensions.luasnip",
    },
  },
  event = "VeryLazy",
  cmd = "Telescope",
  keys = {
    { "<C-S-p>",    mode = "n", desc = "Find Files Current Dir" },
    { "<leader>ff", mode = "n", desc = "Find files" },
    { "<C-p>",      mode = "n", desc = "Find Git files" },
    { "<leader>fg", mode = "n", desc = "Find Git files" },
    { "<leader>fb", mode = "n", desc = "Find buffers" },
    { "<leader>gf", mode = "n", desc = "Grep Files Current Dir" },
    { "<leader>gg", mode = "n", desc = "Grep Git Repo" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    })
    local builtin = require("telescope.builtin")

    require("telescope").load_extension("luasnip")
    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("git_grep")
    require("telescope").load_extension("lsp_handlers")

    vim.keymap.set("n", "<C-S-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>gf", builtin.live_grep, { desc = "Grep Files Current Dir" })
    vim.keymap.set('n', '<leader>gg', function() require('git_grep').live_grep() end, { desc = "Grep Git repo" })
  end,
}
