return {
    "nvim-treesitter/nvim-treesitter",
    -- Nvim Treesitter configurations and abstraction layer
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            highlight = {
                enable = true,
                disable = { "yaml" },
            },
            indent = {
                enable = true,
                disable = { "yaml" },
            },
            matchup = {
                enable = true, -- mandatory, false will disable the whole extension
            },
        })
    end,
}
