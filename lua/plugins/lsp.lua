return {
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp", -- Completion engine
		after = "friendly-snippets",
		config = require("plugins.configs.cmp"),
	},
	{
		"rafamadriz/friendly-snippets", -- Predefined snippets for different languages
		event = "InsertEnter",
	},
	{
		"onsails/lspkind.nvim", -- Adds icons to the autocompletion menu
		config = function()
			require("lspkind").init({
				mode = "symbol_text",
				preset = "codicons",
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip", -- Snippet engine
		after = "nvim-cmp",
		config = require("plugins.configs.luasnip"),
	},
	{
		"saadparwaiz1/cmp_luasnip", -- Snippet completion source for nvim-cmp
		after = "LuaSnip",
	},
	{
		"ray-x/lsp_signature.nvim", -- Signature help for LSP functions
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	"hrsh7th/cmp-nvim-lua", -- Neovim Lua API completion
	"hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
	"hrsh7th/cmp-buffer", -- Buffer completion source for nvim-cmp
	"hrsh7th/cmp-path", -- Filesystem paths completion source for nvim-cmp

	-- Language Server Protocol (LSP)
	{
		"williamboman/mason.nvim", -- LSP server, DAP server, linter, and formatter installer
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- Integration between Mason and lspconfig
		config = require("plugins.configs.mason-lspconfig"),
	},
	{
		"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
		config = function() end,
	},
	{
		"jay-babu/mason-null-ls.nvim", -- Integration between Mason and null-ls
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = require("utils.lsp").ensure_installed_null_ls,
				automatic_installation = true,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim", -- General-purpose LSP server
		config = require("plugins.configs.none-ls"),
	},
	-- Syntax Highlighting and Treesitter
	{
		"nvim-treesitter/nvim-treesitter", -- Treesitter configurations and abstraction layer
		event = { "BufReadPost", "BufNewFile" },
		tag = "v0.9.2",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context", -- Sticky context for code blocks
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = {
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	-- TypeScript Support
	{
		"pmizio/typescript-tools.nvim", -- TypeScript-specific tools
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("typescript-tools").setup({})
		end,
	},
	{
		"b0o/SchemaStore.nvim", -- JSON schema support for LSP
	},
	-- For Nvm
	{
		"pipoprods/nvm.nvim",
		config = true,
	},
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{
		"prisma/vim-prisma",
	},
}
