return {
  -- {
  --   "qualiabyte/vim-colorstepper",
  --   lazy = false,
  --   config = function()
  --     vim.keymap.set("n", "<F6>", "<cmd>call StepColorPrev()<cr>")
  --     vim.keymap.set("n", "<F7>", "<cmd>call StepColorNext()<cr>")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        term_colors = true,
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        color_overrides = {
          mocha = {
            base = "#151515",
            mantle = "#0e0e0e",
            crust = "#080808",
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        style = "vulgaris",
        colors = {
          bg0 = "#151515"
        }
      })
      vim.cmd.colorscheme("bamboo")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfox")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("onedark")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("material")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "savq/melange-nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("melange")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nordic")
    end,
  },
  {
    "tomasiser/vim-code-dark",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("codedark")
    end,
  },
}
