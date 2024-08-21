local getcwd = function()
	local file = vim.fn.expand("%:p")
	-- to run inside a package root if exist
	if string.find(file, "/packages/") then
		return string.match(file, "(.-/[^/]+/)src")
	end
	return vim.fn.getcwd()
end

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
	-- {
	-- 	"github/copilot.vim",
	-- 	lazy = false,
	-- 	config = function() end,
	-- },
	{
		{
			"supermaven-inc/supermaven-nvim",
			config = function()
				require("supermaven-nvim").setup({
					-- keymaps = {
					-- 	accept_suggestion = "<S-space>",
					-- 	clear_suggestion = "<C-]>",
					-- 	accept_word = "<C-j>",
					-- },
					-- ignore_filetypes = { cpp = true },
					-- log_level = "info", -- set to "off" to disable logging completely
					-- disable_inline_completion = false, -- disables inline completion for use with cmp
					-- disable_keymaps = false, -- disables built in keymaps for more manual control
					disable_keymaps = true,
				})
			end,
		},
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
