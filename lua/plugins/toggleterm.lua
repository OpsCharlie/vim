return {
  -- A neovim plugin to persist and toggle multiple terminals during an editing session
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy =true,
  keys = {
    { '<leader>t', mode = {'n', 'i', 't'}, '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal', },
    { '<leader>t', mode = 'v', '<cmd>ToggleTermSendVisualLines<cr>', desc = 'Toggle Terminal Execute Visual', },
    { '<CC--h>', mode = 't', '<cmd>wincmd h<cr>', desc = 'Terminal Move Left', },
    { '<C-j>', mode = 't', '<cmd>wincmd j<cr>', desc = 'Terminal Move Down', },
    { '<C-k>', mode = 't', '<cmd>wincmd k<cr>', desc = 'Terminal Move Up', },
    { '<C-l>', mode = 't', '<cmd>wincmd l<cr>', desc = 'Terminal Move Right', },
  },
  config = function()
    require('toggleterm').setup {}
  end,
}
