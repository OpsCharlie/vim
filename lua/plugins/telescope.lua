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
    -- {
    --   "<C-S-p>",
    --   function() require("telescope.builtin").find_files() end,
    --   mode = "n",
    --   desc = "Find files",
    -- },
    -- {
    --   "<leader>ff",
    --   function() require("telescope.builtin").find_files() end,
    --   mode = "n",
    --   desc = "Find files",
    -- },
    -- {
    --   "<C-p>",
    --   function() require("telescope.builtin").git_files() end,
    --   mode = "n",
    --   desc = "Find git files",
    -- },
    -- {
    --   "<leader>fg",
    --   function() require("telescope.builtin").git_files() end,
    --   mode = "n",
    --   desc = "Find git files",
    -- },
    -- {
    --   "<leader>fb",
    --   function() require("telescope.builtin").buffers() end,
    --   mode = "n",
    --   desc = "Find buffers",
    -- },
    {
      "<leader>gf",
      function() require("telescope.builtin").live_grep() end,
      mode = "n",
      desc = "Grep Files Current Dir",
    },
    {
      "<leader>gg",
      function()
        local ok, gg = pcall(require, "git_grep")
        if ok then
          gg.live_grep()
        else
          vim.notify("git_grep extension not available", vim.log.levels.ERROR)
        end
      end,
      mode = "n",
      desc = "Grep Git repo",
    },
    {
      "<leader>lr",
      function() require("telescope.builtin").lsp_references() end,
      desc = "LSP References",
    },
    {
      "<leader>ld",
      function() require("telescope.builtin").lsp_definitions() end,
      desc = "LSP Definitions",
    },
    {
      "<leader>fd",
      function() require("telescope.builtin").diagnostics() end,
      mode = "n",
      desc = "File Diagnostics",
    },
    {
      "<leader>ls",
      function() require("telescope.builtin").lsp_document_symbols() end,
      mode = "n",
      desc = "List document Symbols",
    },
    {
      "<leader>lm",
      function() require("telescope.builtin").marks() end,
      mode = "n",
      desc = "List marks",
    }
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
  end,
}