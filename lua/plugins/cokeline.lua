return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
  },
  config = function()
    require("cokeline").setup()
  end,
  vim.keymap.set("n", "<S-TAB>", function() require("cokeline.mappings").by_step("focus", "-1") end, { desc = "Previous buffer" }),
  vim.keymap.set("n", "<TAB>", function() require("cokeline.mappings").by_step("focus", "1") end, { desc = "Next buffer" }),
}
