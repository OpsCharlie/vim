return {
    "robbles/logstash.vim",
    -- highlights configuration files for logstash
    lazy = true,
    ft = { "logstash" },
    config = function()
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.keymap.set(
            "n",
            "<F2>",
            ":%s/^\\s*<CR>:g/{/+ normal >G<CR>:g/}/normal <G<CR>:g/{.*}/:><CR>:g/\\[/+ normal >G<CR>:g/\\]/normal <G<CR>:g/\\[.*\\]/:><CR>"
        )
    end,
}
