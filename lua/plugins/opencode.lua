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
  dependencies = {
    { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
  },
  keys = {
    { '<leader>ot', function() require('opencode').toggle() end,                                  desc = 'Toggle opencode' },
    { '<leader>oA', function() require('opencode').ask() end,                                     desc = 'Ask opencode' },
    { '<leader>oa', function() require('opencode').ask('@cursor: ') end,                          desc = 'Ask opencode about this',      mode = 'n' },
    { '<leader>oa', function() require('opencode').ask('@selection: ') end,                       desc = 'Ask opencode about selection', mode = 'v' },
    { '<leader>on', function() require('opencode').command('session_new') end,                    desc = 'New opencode session' },
    { '<leader>oy', function() require('opencode').command('messages_copy') end,                  desc = 'Copy last opencode response' },
    { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end,          desc = 'Messages half page up' },
    { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end,        desc = 'Messages half page down' },
    { '<leader>os', function() require('opencode').select() end,                                  desc = 'Select opencode prompt',       mode = { 'n', 'v' } },
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
        vim.keymap.set({'t', 'n'}, '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })
        vim.keymap.set({'t', 'n'}, '<C-h>', '<cmd>wincmd h<cr>')
        vim.keymap.set({'t', 'n'}, '<C-j>', '<cmd>wincmd j<cr>')
        vim.keymap.set({'t', 'n'}, '<C-k>', '<cmd>wincmd k<cr>')
        vim.keymap.set({'t', 'n'}, '<C-l>', '<cmd>wincmd l<cr>')
      end,
    })

  end,
}
