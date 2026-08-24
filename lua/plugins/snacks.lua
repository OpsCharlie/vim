return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = false },
    bigfile = require("config.snacks.bigfile"),
    dashboard = { enabled = false },
    debug = { enabled = false },
    explorer = require("config.snacks.explorer"),
    image = require("config.snacks.image"),
    indent = require("config.snacks.indent"),
    input = require("config.snacks.input"),
    lazygit = { enabled = false },
    notifier = require("config.snacks.notifier"),
    notify = { enabled = false },
    picker = require("config.snacks.picker"),
    profiler = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scratch = require("config.snacks.scratch"),
    statuscolumn = require("config.snacks.statuscolumn"),
    terminal = require("config.snacks.terminal"),
    words = require("config.snacks.words"),
    zen = { enabled = false },
  },
  keys = {
    -- explorer
    { "<C-n>",      function() Snacks.explorer.open() end,   desc = "Toggle Snacks Explorer" },
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
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end,              desc = "Find Buffers" },
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
    { "<leader>gS", function() Snacks.picker.git_stash() end,            desc = "Git Stash" },
    -- bookmarks
    { "<leader>ba", function() require("config.snacks.bookmarks").add_bookmark() end, desc = "Add Bookmark" },
    { "<leader>fB", function() Snacks.picker({ source = "bookmarks" }) end, desc = "Find Bookmarks" },
    -- diagnostics
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end,   desc = "Find Diagnostics Buffer" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition LSP" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration LSP" },
    { "gr",         function() Snacks.picker.lsp_references() end,       nowait = true,                      desc = "References LSP" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation LSP" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition LSP" },
    -- Scratch
    { "<leader>sb", function() Snacks.scratch() end,                     desc = "Scratch Buffer" },
    { "<leader>sf", function() Snacks.scratch.select() end,              desc = "Find Scratch Buffer" },
    -- Other
    { "<C-w>z",     function() Snacks.zen.zoom() end,                    desc = "Toggle Zoom" },
    { "<leader>tt", function() Snacks.terminal.toggle() end,             desc = "Toggle Terminal" },
    { "<leader>tW", function()
      if Snacks.words.is_enabled() then
        Snacks.words.disable()
      else
        Snacks.words.enable()
      end
    end, desc = "Toggle Words (LSP reference highlights)" },
  },
  init = function()
    vim.o.autochdir = false
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#3a3a3a", nocombine = true })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#5b595f", nocombine = true })
    vim.api.nvim_create_user_command("Picker", function(opts)
      local args = opts.args
      if args and args ~= "" then
        Snacks.picker(args)
      else
        Snacks.picker()
      end
    end, {
      desc = "Open Snacks Picker",
      nargs = "?",
      complete = function(arg_lead)
        local sources = vim.tbl_keys(Snacks.picker.sources or {})
        table.sort(sources)
        if arg_lead == "" then
          return sources
        end
        local matches = {}
        for _, source in ipairs(sources) do
          if source:find(arg_lead, 1, true) then
            table.insert(matches, source)
          end
        end
        return matches
      end
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Snacks.toggle.diagnostics():map("<leader>td")
        Snacks.toggle.treesitter():map("<leader>tT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
        Snacks.toggle.option("wrap", { off = false, on = true, name = "Wrap" }):map("<leader>tw")

        -- Snacks.toggle.line_number():map("<leader>tl")
        Snacks.toggle.option("conceallevel",
          { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "ConcealLevel" }):map("<leader>tC")
        Snacks.toggle.inlay_hints():map("<leader>th")
        Snacks.toggle.dim():map("<leader>tD")
        Snacks.toggle.zoom():map("<leader>tz")
        Snacks.toggle.zen():map("<leader>tZ")

        -- Add bookmarks source
        Snacks.config.picker.sources.bookmarks = {
          finder = function()
            return require("config.snacks.bookmarks").get_items()
          end,
          actions = {
            confirm = function(picker, item)
              if item and item.dir then
                Snacks.explorer.open({ cwd = item.file })
                picker:close()
              end
            end,
            remove = function(picker, item)
              if item then
                require("config.snacks.bookmarks").remove_bookmark(item.file)
                picker:find()
              end
            end,
          },
          win = {
            list = {
              keys = {
                ["<CR>"] = "confirm",
                ["d"] = "remove",
              },
            },
          },
        }
      end,
    })
  end,
}
