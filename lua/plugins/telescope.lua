return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
      {
    "benfowler/telescope-luasnip.nvim",
    module = "telescope._extensions.luasnip",
      },
    },
    lazy = true,
    cmd = "Telescope",
    keys = {
      { "<leader>fg", mode = "n", desc = "File grep" },
      { "<C-p>", mode = "n", desc = "File file" },
    },
    config = function()
      require("telescope").setup({
        require('telescope').load_extension('luasnip'),
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      -- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })

      require("telescope").load_extension("ui-select")
    end,
  }
