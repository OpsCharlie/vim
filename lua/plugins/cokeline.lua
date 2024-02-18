return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",     -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
  },
  config = function()
    local get_hex = require("cokeline.hlgroups").get_hl_attr
    require("cokeline").setup({
      default_hl = {
        fg = function(buffer)
          if buffer.is_modified and buffer.is_focused then
            return "#ff0000"
          elseif buffer.is_focused then
            return get_hex("Normal", "fg")
          elseif buffer.is_modified then
            return '#b30000'
          else
            return get_hex("Comment", "fg")
          end
        end,
      },
    })
  end,
  vim.keymap.set("n", "<S-TAB>", function()
    require("cokeline.mappings").by_step("focus", "-1")
  end, { desc = "Previous buffer" }),
  vim.keymap.set("n", "<TAB>", function()
    require("cokeline.mappings").by_step("focus", "1")
  end, { desc = "Next buffer" }),
}
