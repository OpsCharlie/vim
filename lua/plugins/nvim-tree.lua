return {
  "nvim-tree/nvim-tree.lua",
  -- A File Explorer For Neovim
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- Provides Nerd Font 1 icons (glyphs) for use by Neovim plugins
    -- https://www.nerdfonts.com/font-downloads
  },
  event = "VeryLazy",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Tree" },
    { "<A-n>", "<cmd>NvimTreeFocus<CR>",  desc = "Focus File Tree" },
  },
  config = function()
    local nvim_tree_api = require("nvim-tree.api")

    local function on_attach(bufnr)
      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true
        }
      end

      nvim_tree_api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "C", nvim_tree_api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", ">", nvim_tree_api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", "<", nvim_tree_api.tree.change_root_to_parent, opts("Up"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "󰌶",
          info = "󰋽",
          warning = "󰀪",
          error = "󰅚",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      view = {
        width = 30,
        side = "left",
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
