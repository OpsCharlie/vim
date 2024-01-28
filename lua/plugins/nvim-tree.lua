return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local nvim_tree_api = require("nvim-tree.api")
    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
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
      diagnostics = { enable = false },
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
        width = 40,
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
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<A-n>", ":NvimTreeFocus<CR>", { silent = true })
  end,
}
-- return {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--
--   config = function()
--     local nvim_tree_api = require("nvim-tree.api")
--     local function on_attach(bufnr)
--       local function opts(desc)
--         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--       end
--
--       nvim_tree_api.config.mappings.default_on_attach(bufnr)
--       vim.keymap.set("n", "C", nvim_tree_api.tree.change_root_to_node, opts("CD"))
--       vim.keymap.set("n", ">", nvim_tree_api.tree.change_root_to_node, opts("CD"))
--       vim.keymap.set("n", "<", nvim_tree_api.tree.change_root_to_parent, opts("Up"))
--     end
--     require("nvim-tree").setup({
--       on_attach = on_attach,
--       filters = {
--         dotfiles = false,
--       },
--       disable_netrw = true,
--       hijack_netrw = true,
--       hijack_cursor = true,
--       hijack_unnamed_buffer_when_opening = false,
--       sync_root_with_cwd = true,
--       update_focused_file = {
--         enable = true,
--         update_root = false,
--       },
--       view = {
--         adaptive_size = false,
--         side = "left",
--         width = 30,
--         preserve_window_proportions = true,
--       },
--       git = {
--         enable = true,
--         ignore = true,
--       },
--       filesystem_watchers = {
--         enable = true,
--       },
--       actions = {
--         open_file = {
--           resize_window = true,
--         },
--       },
--       renderer = {
--         root_folder_label = true,
--         highlight_git = true,
--         highlight_opened_files = "none",
--
--         indent_markers = {
--           enable = false,
--         },
--
--         icons = {
--           show = {
--             file = true,
--             folder = true,
--             folder_arrow = true,
--             git = false,
--           },
--
--           glyphs = {
--             default = "󰈚",
--             symlink = "",
--             folder = {
--               default = "",
--               empty = "",
--               empty_open = "",
--               open = "",
--               symlink = "",
--               symlink_open = "",
--               arrow_open = "",
--               arrow_closed = "",
--             },
--             git = {
--               unstaged = "✗",
--               staged = "✓",
--               unmerged = "",
--               renamed = "➜",
--               untracked = "★",
--               deleted = "",
--               ignored = "◌",
--             },
--           },
--         },
--       },
--     })
--     vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
--     vim.keymap.set("n", "<A-n>", ":NvimTreeFocus<CR>", { silent = true })
--   end,
-- }
