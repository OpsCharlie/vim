return {
  {
    "tpope/vim-fugitive",
    -- Vim plugin for Git
    lazy = true,
    cmd = {
      "Gread",
      "Gwrite",
      "GRemove",
      "GDelete",
      "GMove",
      "GRename",
      "GBrowse",
      "Gdiffsplit",
      "Ghdiffsplit",
      "Gvdiffsplit",
      "Git",
    },
    keys = {
      { '<leader>gD', '<cmd>Gvdiffsplit<CR>', desc = 'Git diff' },
    },
  },
  -- {
  --   'junegunn/gv.vim',
  --   -- Git commit browser
  --   dependencies = { 'tpope/vim-fugitive' },
  --   lazy = true,
  --   cmd = 'GV',
  --   keys = {
  --     { '<leader>gl', '<cmd>GV<CR>', desc = 'Git log viewer' },
  --   },
  -- },
}
