return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- Plugin to improve viewing Markdown files in Neovim
    lazy = true,
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        enabled = true,
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        position = "inline",
        width = "block",
        right_pad = 1,
        border = true,
        border_virtual = true,
      },
      bullet = {
        enabled = true,
        -- https://www.alt-codes.net/math-symbols-list
        icons = { "•", "•" },
      },
      code = {
        sign = false,
        left_pad = 2,
      },
    },
    init = function()
      vim.api.nvim_set_hl(0, "RenderMarkdownHeading", { bold = true })
    end,
  },
  {
    'mzlogin/vim-markdown-toc',
    -- Generate table of contents for Markdown files
    cmd = { 'GenTocGFM', 'GenTocRedcarpet', 'GenTocGitLab', 'UpdateToc' },
    ft = 'markdown',
    keys = {
      { '<leader>mo', '<cmd>UpdateToc<CR>', desc = 'Update table of contents' },
    },
    init = function()
      vim.g.vmt_auto_update_on_save = 0
    end,
  },
}
