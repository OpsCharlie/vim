return {
  "kevinhwang91/nvim-hlslens",
  -- Lazy-load on the keys/events that actually trigger a search, instead of
  -- loading eagerly at startup.
  event = "CmdlineEnter",
  keys = {
    -- Keep the existing "center search result" (nzz/Nzz) behavior from
    -- config/options/keymaps.lua, just add the hlslens lens on top.
    { "n", [[<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Next search match" },
    { "N", [[<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Previous search match" },
    { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word under cursor" },
    { "#", [[#<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word under cursor (backward)" },
    { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], desc = "Search partial word under cursor" },
    { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], desc = "Search partial word under cursor (backward)" },
  },
  config = function()
    require("hlslens").setup()
  end,
}
