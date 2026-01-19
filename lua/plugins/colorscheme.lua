return {
	-- Themes/Colorschemes
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				options = {
					transparency = false,
					cursorline = true,
				},
				highlights = {
					NvimTreeGitDirty = { fg = "#E5C07B" },
					NvimTreeGitStaged = { fg = "#98C379" },
					NvimTreeGitNew = { fg = "#98C379" },
					NvimTreeGitDeleted = { fg = "#E06C75" },
					NvimTreeGitMerge = { fg = "#C678DD" },
					NvimTreeGitRenamed = { fg = "#61AFEF" },
				},
			})
			vim.cmd("colorscheme onedark_vivid")
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
