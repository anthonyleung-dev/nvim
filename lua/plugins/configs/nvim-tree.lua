return function()
	local icons = {
		git_placement = "signcolumn",
		modified_placement = "signcolumn",
		padding = " ",
		glyphs = {
			default = "󰈔",
			folder = {
				arrow_closed = "",
				arrow_open = "",
				default = " ",
				open = " ",
				empty = " ",
				empty_open = " ",
				symlink = "󰉒 ",
				symlink_open = "󰉒 ",
			},
			git = {
				deleted = "",
				unstaged = "",
				untracked = "",
				staged = "",
				unmerged = "",
			},
		},
	}

	local renderer = {
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = { corner = "╰" },
		},
		icons = icons,
		highlight_git = "all",
	}

	require("nvim-tree").setup({
		hijack_cursor = true,
		sync_root_with_cwd = true,
		view = {
			adaptive_size = true,
		},
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		renderer = renderer,
		git = { ignore = false },
		diagnostics = { enable = true },
	})
end
