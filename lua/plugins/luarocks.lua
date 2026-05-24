return {
  "vhyrro/luarocks.nvim",
  priority = 1000,
  init = function()
    local rocks = vim.fn.stdpath("data") .. "/lazy/luarocks.nvim/.rocks"
    package.path = package.path .. ";" .. rocks .. "/share/lua/5.1/luarocks/vendor/?.lua"
  end,
  config = true,
}
