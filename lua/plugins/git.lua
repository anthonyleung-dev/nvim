return {
	-- Git Integration
	{
		"NeogitOrg/neogit", -- Magit-like interface for Neovim
		dependencies = {
			"nvim-lua/plenary.nvim", -- Utility functions required by many plugins
			"sindrets/diffview.nvim", -- Side-by-side diff view for Git
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim", -- Git integration for buffers
		config = require("plugins.configs.gitsigns"),
	},
	"f-person/git-blame.nvim", -- Show Git blame info in the gutter
	"sindrets/diffview.nvim", -- View Git diffs in a side-by-side layout
	{
		"NeogitOrg/neogit", -- Magit-like interface for Neovim
		dependencies = {
			"nvim-lua/plenary.nvim", -- Utility functions required by many plugins
			"sindrets/diffview.nvim", -- Side-by-side diff view for Git
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim", -- Git integration for buffers
		config = require("plugins.configs.gitsigns"),
	},
	"f-person/git-blame.nvim", -- Show Git blame info in the gutter
	"sindrets/diffview.nvim", -- View Git diffs in a side-by-side layout
}
