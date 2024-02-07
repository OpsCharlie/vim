return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        globalstatus = true,
      },
      sections = {
        -- lualine_c = {
        --   {
        --     "filename",
        --     path = 2,
        --     -- color = "#B22222"
        --   },
        -- },
        lualine_c = {
          {
            function()
              local bg = "#404040" -- not modified
              if vim.bo.modified then
                bg = "#B22222"     -- unsaved
              elseif vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(0), 'readonly') then
                bg = "#b26a22" -- readonly
              end
              vim.cmd("hi! lualine_filename_status guibg=" .. bg)
              return vim.fn.expand("%:p")
            end,
            "filename",
            color = "lualine_filename_status",
          },
        },
      },
    })
  end,
}

-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local custom_fname = require("lualine.components.filename"):extend()
--     local highlight = require("lualine.highlight")
--     local default_status_colors = { saved = "#228B22", modified = "#C70039" }
--
--     function custom_fname:init(options)
--       custom_fname.super.init(self, options)
--       self.status_colors = {
--         saved = highlight.create_component_highlight_group(
--           { bg = default_status_colors.saved },
--           "filename_status_saved",
--           self.options
--         ),
--         modified = highlight.create_component_highlight_group(
--           { bg = default_status_colors.modified },
--           "filename_status_modified",
--           self.options
--         ),
--       }
--       if self.options.color == nil then
--         self.options.color = ""
--       end
--     end
--
--     function custom_fname:update_status()
--       local data = custom_fname.super.update_status(self)
--       data = highlight.component_format_highlight(
--         vim.bo.modified and self.status_colors.modified or self.status_colors.saved
--       ) .. data
--       return data
--     end
--
--     require("lualine").setup({
--       lualine_c = {custom_fname},
--       -- options = {
--       --   theme = "catppuccin",
--       --   globalstatus = true,
--       -- },
--     })
--   end,
-- }
