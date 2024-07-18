-- return {
--   "echasnovski/mini.indentscope",
--   version = "*",
--   lazy = true,
--   event = { "BufReadPost", "BufNewFile" },
--   config = function()
--     require("mini.indentscope").setup({
--       -- symbol = '╎',
--       -- symbol = "┆",
--       symbol = "│",
--       vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#808080" }),
--       options = {
--         try_as_border = true,
--       },
--       draw = {
--         -- animation = require("mini.indentscope").gen_animation.linear({ easing = 'out', duration = 100, unit = 'total' }),
--         animation = require("mini.indentscope").gen_animation.none(),
--         delay = 0,
--       },
--     })
--   end,
-- }
return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    main = "ibl",
    opts = {
        indentLine_enabled = 1,
        filetype_exclude = {
            "help",
            "terminal",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "mason",
            "nvdash",
            "nvcheatsheet",
        },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = true,
        show_current_context_start = true,
    },
    config = function()
        require("ibl").setup({
            scope = {
                show_start = false,
                show_end = false,
            },
            indent = {
                -- char = "┆"
                -- char = "┊"
                char = "¦"
            }
        })
        local hooks = require "ibl.hooks"
        hooks.register(
            hooks.type.WHITESPACE,
            hooks.builtin.hide_first_space_indent_level
        )
    end,
}
