return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = false },
    bigfile = require("config.snacks.bigfile"),
    bufdelete = { enabled = false },
    dashboard = { enabled = false },
    debug = { enabled = false },
    dim = { enabled = false },
    explorer = require("config.snacks.explorer"),
    git = { enabled = false },
    gitbrowse = { enabled = false },
    image = { enabled = false },
    indent = { enabled = false },
    input = require("config.snacks.input"),
    layout = { enabled = false },
    lazygit = { enabled = false },
    notifier = require("config.snacks.notifier"),
    notify = { enabled = false },
    picker = require("config.snacks.picker"),
    profiler = { enabled = false },
    quickfile = { enabled = false },
    rename = { enabled = false },
    scope = { enabled = false },
    scratch = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    terminal = { enabled = false },
    toggle = { enabled = false },
    util = { enabled = false },
    win = { enabled = false },
    words = { enabled = false },
    zen = { enabled = false },
  },
  keys = {
    { "<C-n>",      function() Snacks.explorer.open() end, desc = "Toggle Snacks Explorer" },
    {
      "<M-n>",
      function()
        local pickers = Snacks.picker.get({ source = "explorer" })
        local picker = pickers[1] or Snacks.explorer.open()
        if picker then
          picker:focus("list")
        end
      end,
      desc = "Jump to Snacks Explorer"
    },
    { "<leader>lg", function() Snacks.lazygit() end,       desc = "Lazygit" },
  },
  init = function()
    vim.o.autochdir = false
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Snacks.toggle.diagnostics():map("<leader>ud")
        -- Snacks.toggle.line_number():map("<leader>ul")
        -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        -- Snacks.toggle.inlay_hints():map("<leader>uh")
        -- Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
