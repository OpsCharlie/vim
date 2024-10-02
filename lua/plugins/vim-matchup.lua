return {
	"andymass/vim-matchup",
	-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
	event = "BufReadPost",
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }

		-- Enable matchup override for custom syntax highlighting
		vim.g.matchup_override_vim_regex_highlight = 1
	end,
}
