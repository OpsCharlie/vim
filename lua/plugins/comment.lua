return {
    "numToStr/Comment.nvim",
    -- Smart and Powerful commenting plugin for neovim
    lazy = true,
    keys = {
        { "<C-e>", mode = { "n", "v" }, desc = "Comment toggle lines" },
        { "gcc",   mode = "n",          desc = "Comment toggle current line" },
        { "gc",    mode = { "n", "o" }, desc = "Comment toggle linewise" },
        { "gc",    mode = "x",          desc = "Comment toggle linewise (visual)" },
        { "gbc",   mode = "n",          desc = "Comment toggle current block" },
        { "gb",    mode = { "n", "o" }, desc = "Comment toggle blockwise" },
        { "gb",    mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<C-e>",
                block = "gbc",
            },
            opleader = {
                line = "<C-e>",
                block = "gb",
            },
        })
    end,
}
