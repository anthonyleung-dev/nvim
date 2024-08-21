return function()
	local icons = {
		git_placement = "after",
		modified_placement = "after",
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
	--
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
		-- view = view,
		-- system_open = system_open,
		renderer = renderer,
		git = { ignore = false },
		diagnostics = { enable = true },
		-- notify = notify,
	})
end
