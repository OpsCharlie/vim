return {
  "NvChad/nvim-colorizer.lua",
  -- A high-performance color highlighter
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*", "!prompt", "!popup" },
      options = {
        parsers = {
          css = true,
          css_fn = true,
          names = { enable = false },
          hex = { enable = true, rgb = true, rrggbb = true, rrggbbaa = true, aarrggbb = false },
          rgb = { enable = true },
          hsl = { enable = true },
          oklch = { enable = true },
          tailwind = { enable = true },
        },
        display = {
          mode = "background",
        },
      },
    })
  end,
}
