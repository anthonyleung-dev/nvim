return {
	-- Themes/Colorschemes
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "dark",
				transparent = false,
				code_style = {
					comments = "italic",
					keywords = "bold",
					functions = "none",
					strings = "none",
					variables = "none",
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
			require("onedark").load()

			-- Override highlights with nvim_set_hl to match VS Code Atom One Dark.
			-- Plugin highlights table uses :highlight which cannot handle @ prefixed groups.
			-- Treesitter v0.9.2 uses old capture names (@include, not @keyword.import).
			local hl = vim.api.nvim_set_hl
			-- Variables: red
			hl(0, "@variable", { fg = "#E06C75" })
			hl(0, "@variable.builtin", { fg = "#E06C75" })
			-- Clear LSP variable so treesitter @function/@variable wins
			hl(0, "@lsp.type.variable", {})
			-- Const variables: orange (readonly modifier from LSP)
			-- hl(0, "@lsp.typemod.variable.readonly", { fg = "#E5C07B" })
			-- Properties: white
			hl(0, "@property", { fg = "#ABB2BF" })
			hl(0, "@lsp.type.property", { fg = "#ABB2BF" })
			hl(0, "@lsp.typemod.property.declaration", { fg = "#ABB2BF" })
			-- Member functions: blue
			hl(0, "@lsp.type.member", { fg = "#61AFEF" })
			-- Conditional: purple (if, else, switch)
			hl(0, "@conditional", { fg = "#C678DD" })
			hl(0, "@keyword.conditional", { fg = "#C678DD" })
			-- use keyword: purple (old treesitter name @include, new name @keyword.import)
			hl(0, "@include", { fg = "#C678DD" })
			hl(0, "@keyword.import", { fg = "#C678DD" })
			hl(0, "@lsp.type.keyword", { fg = "#C678DD", bold = true })
			-- Types: blue (Path, Vec, String, etc.)
			hl(0, "@type", { fg = "#61AFEF" })
			hl(0, "@type.builtin", { fg = "#61AFEF" })
			hl(0, "@type.definition", { fg = "#61AFEF" })
			hl(0, "@lsp.type.type", { fg = "#61AFEF" })
			hl(0, "@lsp.type.struct", { fg = "#61AFEF" })
			hl(0, "@lsp.type.enum", { fg = "#61AFEF" })
			hl(0, "@lsp.type.interface", { fg = "#61AFEF" })
			hl(0, "@lsp.type.typeParameter", { fg = "#61AFEF" })
			-- :: delimiter: purple
			hl(0, "@punctuation.delimiter", { fg = "#FFFFFF" })
			-- NvimTree folder text: white
			hl(0, "NvimTreeFolderName", { fg = "#ABB2BF" })
			hl(0, "NvimTreeOpenedFolderName", { fg = "#ABB2BF" })
			hl(0, "NvimTreeEmptyFolderName", { fg = "#ABB2BF" })
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
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
