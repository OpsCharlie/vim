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
}
