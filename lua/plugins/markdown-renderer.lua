return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- Plugin to improve viewing Markdown files in Neovim
    lazy = true,
    ft = { 'markdown', 'copilot-chat', 'opencode_output' },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      render_modes = true,
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
      { '<leader>mo', '<cmd>UpdateToc<CR>', desc = 'Update ToC Markdown' },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          for i = 1, 6 do
            local group = "@markup.heading." .. i .. ".markdown"
            -- Resolve linked highlight group colors
            local existing = vim.api.nvim_get_hl(0, { name = group, link = false })

            if existing and (existing.fg or existing.bg) then
              local new_hl = vim.tbl_extend("force", existing, {
                bold = true,
                underline = true
              })
              vim.api.nvim_set_hl(0, group, new_hl)
            end
          end
        end,
      })
    end,

  },
}
