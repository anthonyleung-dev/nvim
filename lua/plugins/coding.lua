return {

	"sbdchd/neoformat", -- Code formatting plugin
	{
		"numToStr/Comment.nvim",
	},
	{
		"folke/todo-comments.nvim", -- Highlight and search for TODO comments
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("plugins.configs.todo-comments").opts,
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		config = function()
			require("claude-code").setup()
		end,
	},
	{
		"windwp/nvim-autopairs", -- Automatically close pairs like brackets and quotes
		event = "InsertEnter",
		config = true,
	},
	{
		"nvim-neotest/neotest-jest",
		commit = "c211844",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-jest",
			"marilari88/neotest-vitest",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({}),
				},
			})
		end,
	},
}
