return {
    "kdheepak/lazygit.nvim",
    -- Plugin for calling lazygit from within neovim.
    lazy = true,
    keys = {
        { "<leader>lg", ":LazyGit<CR>", desc = "LazyGit" },
    },
}
