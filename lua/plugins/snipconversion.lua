-- This converts UltiSnips to luasnips.
-- Used for ansible snippets from https://github.com/pearofducks/ansible-vim
return {
  "smjonas/snippet-converter.nvim",
  lazy = true,
  cmd = { "ConvertSnippets" },
  config = function()
    local template = {
      sources = {
        ultisnips = {
          vim.fn.stdpath("config") .. "/vim-snippets/luasnippets",
        },
      },
      output = {
        vscode_luasnip = {
          vim.fn.stdpath("config") .. "/vim-snippets/luasnippets",
        },
      },
    }

    require("snippet_converter").setup({
      templates = { template },
    })
  end,
}
