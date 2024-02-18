return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end
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
      }
    },
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
  "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme "kanagawa"
    end
  },
  {
    "savq/melange-nvim",
    lazy = true,
    config = function()
      vim.cmd.colorscheme "melange"
    end
  }
}
