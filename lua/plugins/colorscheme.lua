return {
	-- Themes/Colorschemes
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "warmer",
			})
			require("onedark").load()
		end,
	},
	{
		"rebelot/kanagawa.nvim", -- Kanagawa colorscheme
	},
	{
		"alexmozaidze/palenight.nvim",
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = true,
		opts = {
			reduced_blue = true,
			cursorline = {
				theme = "dark",
				bold = false,
				bold_number = true,
				blend = 0.7,
			},
			overrides = {
				NvimTreeGitStaged = { fg = "#03ff85" },
				NvimTreeGitDirty = { fg = "#EBCB8B" },
				NvimTreeGitNew = { fg = "#A3BE8C" },
				NvimTreeGitDeleted = { fg = "#BF616A" },
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
