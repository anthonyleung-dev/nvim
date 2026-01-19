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
	{
		"sindrets/diffview.nvim", -- View Git diffs in a side-by-side layout
		opts = {
			diff_binaries = false,
			enhanced_diff_hl = false,
			git_cmd = { "git" },
			hg_cmd = { "hg" },
			use_icons = true,
			show_help_hints = true,
			watch_index = true,
			signs = {
				fold_closed = "",
				fold_open = "",
				done = "",
			},
			view = {
				default = {
					layout = "diff2_horizontal",
					disable_diagnostics = false,
					winbar_info = false,
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
					winbar_info = true,
				},
				file_history = {
					layout = "diff2_horizontal",
					disable_diagnostics = false,
					winbar_info = false,
				},
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
					win_opts = {},
				},
			},
			file_history_panel = {
				log_options = {
					git = {
						single_file = {
							diff_merges = "combined",
						},
						multi_file = {
							diff_merges = "first-parent",
						},
					},
				},
				win_config = {
					position = "bottom",
					height = 16,
					win_opts = {},
				},
			},
		},
		config = function(_, opts)
			-- Set filler character for diff
			vim.opt.fillchars:append({ diff = "╱" })

			-- Custom diff colors (red = delete, green = add)
			vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1a3d1a", fg = "NONE" })
			vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3d1a1a", fg = "#6b3030" })
			vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1a2a3d", fg = "NONE" })
			vim.api.nvim_set_hl(0, "DiffText", { bg = "#2a4a2a", fg = "NONE" })

			require("diffview").setup(opts)
		end,
	}
}
