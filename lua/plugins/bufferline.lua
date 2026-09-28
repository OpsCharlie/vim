return {
  "akinsho/bufferline.nvim",
  -- A snazzy bufferline (tabline) with unique names, diagnostics, close icons
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_duplicate_prefix = true,
        separator_style = "thin",
        always_show_bufferline = true,
      },
      highlights = {
        modified = { fg = "#B22222" },
        modified_visible = { fg = "#B22222" },
        modified_selected = { fg = "#B22222" },
      },
    })

    vim.keymap.set("n", "<TAB>", function()
      require("bufferline").cycle(1)
    end, { desc = "Next buffer" })
    vim.keymap.set("n", "<S-TAB>", function()
      require("bufferline").cycle(-1)
    end, { desc = "Previous buffer" })
  end,
}
