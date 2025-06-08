return {
	{
		"mason-org/mason.nvim",
    lazy = true,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
