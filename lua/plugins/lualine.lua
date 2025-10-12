return {
  "nvim-lualine/lualine.nvim",
  -- A blazing fast and easy to configure Neovim statusline
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_c = {
          {
            function()
              local bg = "#404040" -- not modified
              if vim.bo.modified then
                bg = "#B22222"     -- unsaved
              elseif vim.bo.readonly then
                bg = "#b26a22"     -- readonly
              end
              vim.cmd("hi! lualine_filename_status guibg=" .. bg)
              return vim.fn.expand("%:p")
            end,
            "filename",
            color = "lualine_filename_status",
          },
        },
      },
      extensions = { "quickfix", "nvim-dap-ui", "lazy", "mason", "toggleterm", "trouble" },
    })
  end,
}
