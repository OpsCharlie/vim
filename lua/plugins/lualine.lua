return {
  "nvim-lualine/lualine.nvim",
  -- A blazing fast and easy to configure Neovim statusline
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function state_bg(buf)
      if vim.api.nvim_get_option_value("modified", { buf = buf }) then
        return "#B22222"
      end
      if vim.api.nvim_get_option_value("readonly", { buf = buf }) then
        return "#B26A22"
      end
    end

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
              local bg = state_bg(vim.api.nvim_get_current_buf()) or "#404040"
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
