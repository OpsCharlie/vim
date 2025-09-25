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
    { "<leader>t", function() Snacks.terminal.toggle() end, desc = "Terminal Toggle" },
    -- explorer
    { "<C-n>",     function() Snacks.explorer.open() end,   desc = "Toggle Snacks Explorer" },
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
    { "<leader>:",  function() Snacks.picker.command_history() end,      desc = "Command History" },
    -- buffer
    { "<leader>bd", function() Snacks.bufdelete() end,                   desc = "Delete Buffer" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end,              desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end,                desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
    { "<leader>fm", function() Snacks.picker.marks() end,                desc = "Find Marks" },
    { "<leader>/",  function() Snacks.picker.grep() end,                 desc = "Grep Current Dir" },
    { "<leader>gf", function() Snacks.picker.grep() end,                 desc = "Grep Current Dir" },
    { "<leader>,",  function() Snacks.picker.keymaps() end,              desc = "Find Keymaps" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end,          desc = "Find Symbols LSP" },
    -- git
    { "<leader>gB", function() Snacks.gitbrowse() end,                   desc = "Git Browse Github",         mode = { "n", "v" } },
    { "<leader>lg", function() Snacks.lazygit() end,                     desc = "Lazygit" },
    { "<leader>gl", function() Snacks.picker.git_log() end,              desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,         desc = "Git Blame Line" },
    { "<leader>gb", function() Snacks.git.blame_line() end,              desc = "Git Blame" },
    { "<leader>gs", function() Snacks.picker.git_status() end,           desc = "Git Status" },
    { "<leader>gg", function() Snacks.picker.git_grep() end,             desc = "Git Grep" },
    { "<leader>gf", function() Snacks.picker.grep() end,                 desc = "Grep Current Dir" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,            desc = "Git Stash" },
    -- diagnostics
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end,   desc = "Find Diagnostics Buffer" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition LSP" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration LSP" },
    { "gr",         function() Snacks.picker.lsp_references() end,       nowait = true,                      desc = "References LSP" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation LSP" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition LSP" },
    -- Other
    { "<C-w>z",     function() Snacks.zen.zoom() end,                    desc = "Toggle Zoom" },
  },
  init = function()
    vim.o.autochdir = false
    vim.api.nvim_create_user_command("Picker", function()
      Snacks.picker()
    end, { desc = "Open Snacks Picker" })
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")

        -- Snacks.toggle.line_number():map("<leader>ul")
        -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        -- Snacks.toggle.inlay_hints():map("<leader>uh")
        -- Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
