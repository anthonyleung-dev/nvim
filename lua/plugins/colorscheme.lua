return {
	-- Themes/Colorschemes
	{
		"joshdick/onedark.vim",
		config = function()
			vim.cmd([[colorscheme onedark]])
			vim.cmd([[set background=dark]])
			vim.cmd([[set termguicolors]])
			vim.cmd([[let g:onedark_terminal_italics = 1]])
			vim.cmd([[let g:onedark_termcolors = 256]])
			vim.cmd([[let g:onedark_contrast = "high"]])
			vim.cmd([[let g:onedark_terminal_colors = 1]])
		end,
	},
	{
		"rebelot/kanagawa.nvim", -- Kanagawa colorscheme
	},
	{
		"alexmozaidze/palenight.nvim",
	},
	{
		"AlexvZyl/nordic.nvim", -- Nordic colorscheme with customization options
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load({
				reduced_blue = true,
				cursorline = {
					theme = "dark",
					bold = false,
					bold_number = true,
					blend = 0.7,
				},
				override = {
					NvimTreeGitStaged = { fg = "#03ff85" },
					NvimTreeGitDirty = { fg = "#EBCB8B" },
					NvimTreeGitNew = { fg = "#A3BE8C" },
					NvimTreeGitDeleted = { fg = "#BF616A" },
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
