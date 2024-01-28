return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<C-e>",
        block = "gbc",
      },
      opleader = {
        line = "<C-e>",
        block = "gb",
      },
    })
  end,
}
