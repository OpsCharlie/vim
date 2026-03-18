-- return {}

return {
  "sudo-tee/opencode.nvim",
  keys = {
    { '<leader>to', desc = 'Toggle opencode' },
    { '<leader>o/', desc = 'OC quick_chat', mode = { 'n', 'x' } },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    'folke/snacks.nvim', -- For file picker functionality
    -- 'hrsh7th/nvim-cmp',
    -- 'nvim-telescope/telescope.nvim',
  },
  config = function()
    require("opencode").setup({
      preferred_picker = 'snacks',
      preferred_completion = 'blink',
      default_mode = 'plan',
      keymap = {
        editor = {
          ["<leader>to"] = { "toggle" },
        },
        input_window = {
          ['<cr>'] = { 'submit_input_prompt', mode = { 'n' } },        -- Submit prompt (normal mode)
          ['<esc>'] = false,
          ['<C-c>'] = { 'cancel' },                                    -- Cancel opencode request while it is running,
          ['~'] = { 'mention_file', mode = 'i' },                      -- Pick a file and add to context. See File Mentions section
          ['@'] = { 'mention', mode = 'i' },                           -- Insert mention (file/agent)
          ['/'] = { 'slash_commands', mode = 'i' },                    -- Pick a command to run in the input window
          ['<up>'] = { 'prev_prompt_history', mode = { 'n', 'i' } },   -- Navigate to previous prompt in history
          ['<down>'] = { 'next_prompt_history', mode = { 'n', 'i' } }, -- Navigate to next prompt in history
          ['<M-m>'] = { 'switch_mode' },                               -- Switch between modes (build/plan)
          ['<tab>'] = {
            function()
              local cmp = require('blink.cmp')
              if cmp.is_menu_visible() then
                cmp.select_next()
              else
                cmp.show()
              end
            end,
            mode = { 'i', 's' },
          }, -- Tab completion
          ['<S-Tab>'] = {
            function()
              local cmp = require('blink.cmp')
              if cmp.is_menu_visible() then
                cmp.select_prev()
                return ''
              end
              return '<S-Tab>'
            end,
            mode = { 'i', 's' },
            expr = true,
          }, -- Tab completion
        },
      },
      ui = {
        position = 'right',
        window_width = 0.40,
        icons = {
          preset = 'nerdfonts', -- Try text icons instead of emoji
        },
        input = {
          text = {
            wrap = false, -- Wraps text inside input window
          },
        },
      },
      context = {
        cursor_data = {
          enabled = true,
        },
        diagnostics = {
          warn = true,
          error = true,
        },
      },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "OpencodeEvent",
      callback = function(args)
        if args.data.type == "session.idle" then
          vim.notify("OpenCode finished responding", vim.log.levels.INFO)
        end
      end,
    })

    -- vim.api.nvim_create_autocmd("BufEnter", {
    --   pattern = "opencode://input",
    --   callback = function()
    --     vim.wo.wrap = true
    --   end,
    -- })
  end,
}

-- return {
--   'NickvanDyke/opencode.nvim',
--   lazy = true,
--   keys = {
--     { '<leader>to', function() require('opencode').toggle() end,                                  desc = 'Opencode' },
--     { '<leader>oA', function() require('opencode').ask() end,                                     desc = 'Ask Opencode' },
--     { '<leader>oa', function() require('opencode').ask('@cursor: ') end,                          desc = 'Ask Opencode about this',      mode = 'n' },
--     { '<leader>oa', function() require('opencode').ask('@selection: ') end,                       desc = 'Ask Opencode about selection', mode = 'v' },
--     { '<leader>on', function() require('opencode').command('session_new') end,                    desc = 'New Opencode session' },
--     { '<leader>oy', function() require('opencode').command('messages_copy') end,                  desc = 'Copy last Opencode response' },
--
--     { '<leader>os', function() require('opencode').select() end,                                  desc = 'Select Opencode prompt',       mode = { 'n', 'v' } },
--     { '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, desc = 'Explain this code' },
--   },
--   config = function()
--     vim.g.opencode_opts = {
--       auto_reload = true,
--       terminal = {
--         win = {
--           enter = true,
--         },
--       },
--       auto_register_cmp_sources = { "opencode", "buffer" },
--     }
--
--     vim.opt.autoread = true
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
--       pattern = "term://*opencode*",
--       callback = function()
--         vim.o.timeoutlen = 1000
--         vim.keymap.set({ 't' }, '<leader>to', function() require('opencode').toggle() end, { desc = 'Toggle Opencode' })
--         vim.keymap.set({ 't' }, '<C-h>', '<esc><cmd>TmuxNavigateLeft<cr>')
--         vim.keymap.set({ 't' }, '<C-j>', '<esc><cmd>TmuxNavigateDown<cr>')
--         vim.keymap.set({ 't' }, '<C-k>', '<esc><cmd>TmuxNavigateUp<cr>')
--         vim.keymap.set({ 't' }, '<C-l>', '<esc><cmd>TmuxNavigateRight<cr>')
--         vim.keymap.set('t', '<C-w>z', '<C-\\><C-n><cmd>ZoomWinTabToggle<CR>i', { desc = 'Toggle zoom' })
--       end,
--     })
--   end,
-- }
