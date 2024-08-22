return {
	{
		-- Keybinding Hints
		"folke/which-key.nvim", -- Displays possible keybindings in a popup
	},
	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua", -- File explorer for Neovim
		requires = {
			"kyazdani42/nvim-web-devicons", -- Optional: for file icons
		},
		config = require("plugins.configs.nvim-tree"),
	},
	-- Terminal Integration
	{
		"akinsho/toggleterm.nvim", -- Terminal manager for Neovim
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 10,
				close_on_exit = true,
				shade_terminals = true,
			})

			-- Exit terminal mode with <C-x>
			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<C-x>", [[<C-\><C-n>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
	-- Searching
	{
		"nvim-telescope/telescope.nvim", -- Fuzzy finder and search utility
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- Comments and Annotations
	{
		"kevinhwang91/nvim-bqf", -- Better quickfix window
		ft = "qf",
	},
	{
		"petertriho/nvim-scrollbar", -- Adds a scrollbar with diagnostics and search result markers
		config = function()
			require("scrollbar").setup()
		end,
	},
	{
		"Wansmer/treesj", -- Split and join code blocks
		keys = { "<leader>cm", "<space>cj", "<space>cs" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = true,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				config = {
					week_header = {
						enable = true,
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- Status Line
	{
		"nvim-lualine/lualine.nvim", -- Status line configuration
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for file icons
		config = require("plugins.configs.lualine"),
	},
	-- Colorizer for highlighting colors text in the code
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- Buffer Management
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,

			show_tab_indicators = true,
			show_close_icon = false,
			-- Enable auto-hiding the tab bar when there is only one buffer
			auto_hide = false,
			icons = {
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	-- Breadcrumbs
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
}
