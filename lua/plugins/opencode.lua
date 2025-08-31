return {
  "sudo-tee/opencode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- Default keymaps from sudo-tee/opencode.nvim
    { '<leader>oa',  function() require('opencode.api').toggle() end,                        desc = 'Toggle opencode', },
    { '<leader>oi',  function() require('opencode.api').open_input() end,                    desc = 'Open input window', },
    { '<leader>oI',  function() require('opencode.api').open_input_new_session() end,        desc = 'Open input window (new session)', },
    { '<leader>oo',  function() require('opencode.api').open_output() end,                   desc = 'Open output window', },
    { '<leader>ot',  function() require('opencode.api').toggle_focus() end,                  desc = 'Toggle focus', },
    { '<leader>oq',  function() require('opencode.api').close() end,                         desc = 'Close UI windows', },
    { '<leader>os',  function() require('opencode.api').select_session() end,                desc = 'Select session', },
    { '<leader>op',  function() require('opencode.api').configure_provider() end,            desc = 'Configure provider', },
    { '<leader>od',  function() require('opencode.api').diff_open() end,                     desc = 'Open diff view', },
    { '<leader>o]',  function() require('opencode.api').diff_next() end,                     desc = 'Next file diff', },
    { '<leader>o[',  function() require('opencode.api').diff_prev() end,                     desc = 'Previous file diff', },
    { '<leader>oc',  function() require('opencode.api').diff_close() end,                    desc = 'Close diff view', },
    { '<leader>ora', function() require('opencode.api').diff_revert_all_last_prompt() end,   desc = 'Revert all changes (last prompt)', },
    { '<leader>ort', function() require('opencode.api').diff_revert_this_last_prompt() end,  desc = 'Revert this file (last prompt)', },
    { '<leader>orA', function() require('opencode.api').diff_revert_all_last_session() end,  desc = 'Revert all changes (last session)', },
    { '<leader>orT', function() require('opencode.api').diff_revert_this_last_session() end, desc = 'Revert this file (last session)', },
    { '<leader>ox',  function() require('opencode.api').swap_position() end,                 desc = 'Swap pane position', },

    -- BUILD/PLAN Mode Switching
    { '<leader>ob',  function()
      if require('opencode.api').set_mode then
        require('opencode.api').set_mode('build')
        vim.notify('OpenCode mode: BUILD', vim.log.levels.INFO)
      end
    end, desc = 'Switch to BUILD mode', },
    { '<leader>oB',  function()
      if require('opencode.api').set_mode then
        require('opencode.api').set_mode('plan')
        vim.notify('OpenCode mode: PLAN', vim.log.levels.INFO)
      end
    end, desc = 'Switch to PLAN mode', },
    { '<leader>om',  function()
      if require('opencode.api').get_mode and require('opencode.api').set_mode then
        local current_mode = require('opencode.api').get_mode()
        local next_mode = current_mode == 'build' and 'plan' or 'build'
        require('opencode.api').set_mode(next_mode)
        vim.notify('OpenCode mode: ' .. next_mode:upper(), vim.log.levels.INFO)
      end
    end, desc = 'Toggle BUILD/PLAN mode', },
  },
  config = function()
    require("opencode").setup({
      ui = {
        input = {
          text = {
            wrap = true, -- Enable word wrapping in the input window
          },
        },
      },
    })
  end,
}
