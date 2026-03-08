return {

	"sbdchd/neoformat", -- Code formatting plugin
	{
		"anthonyleung-dev/gtkcss-syntax.nvim",
		ft = "gtkcss",
		config = function()
			require("gtkcss").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = function(ctx)
					if vim.bo.filetype == "dotenv" then
						return "# %s"
					end
				end,
			})
		end,
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
	-- {
	-- 	"milanglacier/minuet-ai.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("minuet").setup({
	-- 			provider = "openai_fim_compatible",
	-- 			n_completions = 1,
	-- 			context_window = 4096,
	-- 			provider_options = {
	-- 				openai_fim_compatible = {
	-- 					api_key = "TERM",
	-- 					name = "Ollama",
	-- 					end_point = "http://localhost:11434/v1/completions",
	-- 					model = "qwen2.5-coder:7b",
	-- 					optional = {
	-- 						max_tokens = 128,
	-- 						top_p = 0.9,
	-- 					},
	-- 				},
	-- 			},
	-- 			virtualtext = {
	-- 				auto_trigger_ft = { "*" },
	-- 				keymap = {
	-- 					accept = "<Tab>",
	-- 					accept_line = "<A-a>",
	-- 					prev = "<A-[>",
	-- 					next = "<A-]>",
	-- 					dismiss = "<A-e>",
	-- 				},
	-- 			},
	-- 		})
	-- 		-- Manual keymaps as fallback
	-- 		vim.keymap.set("i", "<Tab>", function()
	-- 			local minuet_vt = require("minuet.virtualtext")
	-- 			if minuet_vt.action.is_visible() then
	-- 				minuet_vt.action.accept()
	-- 			else
	-- 				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	-- 			end
	-- 		end, { desc = "Accept Minuet completion or Tab" })
	-- 	end,
	-- },
	{
		"supermaven-inc/supermaven-nvim",
		event = "InsertEnter",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-a>",
					accept_word = "<A-w>",
					clear_suggestion = "<A-e>",
				},
				color = {
					suggestion_color = "#888888",
				},
				log_level = "off",
			})
		end,
	},
	{
		"windwp/nvim-autopairs", -- Automatically close pairs like brackets and quotes
		event = "InsertEnter",
		config = true,
	},
	{
		"nvim-pack/nvim-spectre", -- Find and replace panel
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
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
