-- return {}

-- return {
--   "sudo-tee/opencode.nvim",
--   keys = {
--     { '<leader>ot', desc = 'Toggle opencode' },
--     { '<leader>oa', desc = 'Open input window', mode = { 'n', 'v' } },
--     { '<leader>oo', desc = 'Open output window' },
--     { '<leader>oq', desc = 'Close opencode' },
--   },
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     -- 'folke/snacks.nvim', -- For file picker functionality
--     'hrsh7th/nvim-cmp',
--     'nvim-telescope/telescope.nvim',
--   },
--   config = function()
--     require("opencode").setup({
--       -- Disable default global keymaps to avoid conflicts
--       -- default_global_keymaps = false,
--       -- Keep your preferred keymaps
--       keymap = {
--         global = {
--           toggle = '<leader>ot',
--           open_input = '<leader>oa',
--           open_output = '<leader>oo',
--           toggle_focus = '<leader>oz', -- Changed from <leader>ot to <leader>oz to avoid conflict
--           close = '<leader>oq',
--         },
--         window = {
--           submit = '<cr>',
--           submit_insert = false,
--           close = '<esc>',
--           stop = '<C-x>',
--           switch_mode = '<tab>',
--           toggle_pane = false,
--         },
--       },
--       ui = {
--         position = 'right',
--         window_width = 0.40,
--         icons = {
--           preset = 'text',  -- Try text icons instead of emoji
--         },
--       },
--       context = {
--         cursor_data = true,
--         diagnostics = {
--           warn = true,
--           error = true,
--         },
--       },
--      })
--
--     vim.api.nvim_create_autocmd("User", {
--       pattern = "OpencodeEvent",
--       callback = function(args)
--         if args.data.type == "session.idle" then
--           vim.notify("OpenCode finished responding", vim.log.levels.INFO)
--         end
--       end,
--     })
--
--     vim.api.nvim_create_autocmd("BufEnter", {
--       pattern = "opencode://input",
--       callback = function()
--         vim.wo.wrap = true
--       end,
--     })
--
--   end,
-- }

return {
  'NickvanDyke/opencode.nvim',
  lazy = true,
  keys = {
    { '<leader>to', function() require('opencode').toggle() end,                                  desc = 'Opencode' },
    { '<leader>oA', function() require('opencode').ask() end,                                     desc = 'Ask Opencode' },
    { '<leader>oa', function() require('opencode').ask('@cursor: ') end,                          desc = 'Ask Opencode about this',      mode = 'n' },
    { '<leader>oa', function() require('opencode').ask('@selection: ') end,                       desc = 'Ask Opencode about selection', mode = 'v' },
    { '<leader>on', function() require('opencode').command('session_new') end,                    desc = 'New Opencode session' },
    { '<leader>oy', function() require('opencode').command('messages_copy') end,                  desc = 'Copy last Opencode response' },

    { '<leader>os', function() require('opencode').select() end,                                  desc = 'Select Opencode prompt',       mode = { 'n', 'v' } },
    { '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, desc = 'Explain this code' },
  },
  config = function()
    vim.g.opencode_opts = {
      auto_reload = true,
      terminal = {
        win = {
          enter = true,
        },
      },
      auto_register_cmp_sources = { "opencode", "buffer" },
    }

    vim.opt.autoread = true

    vim.api.nvim_create_autocmd("User", {
      pattern = "OpencodeEvent",
      callback = function(args)
        if args.data.type == "session.idle" then
          vim.notify("OpenCode finished responding", vim.log.levels.INFO)
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "term://*opencode*",
      callback = function()
        vim.o.timeoutlen = 1000
        vim.keymap.set({ 't' }, '<leader>to', function() require('opencode').toggle() end, { desc = 'Toggle Opencode' })
        vim.keymap.set({ 't' }, '<C-h>', '<esc><cmd>TmuxNavigateLeft<cr>')
        vim.keymap.set({ 't' }, '<C-j>', '<esc><cmd>TmuxNavigateDown<cr>')
        vim.keymap.set({ 't' }, '<C-k>', '<esc><cmd>TmuxNavigateUp<cr>')
        vim.keymap.set({ 't' }, '<C-l>', '<esc><cmd>TmuxNavigateRight<cr>')
        vim.keymap.set('t', '<C-w>z', '<C-\\><C-n><cmd>ZoomWinTabToggle<CR>i', { desc = 'Toggle zoom' })
      end,
    })
  end,
}
