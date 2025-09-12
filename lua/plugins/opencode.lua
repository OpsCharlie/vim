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
  end,
}
