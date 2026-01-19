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
	-- {
	-- 	"ray-x/lsp_signature.nvim", -- Signature help for LSP functions
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require("lsp_signature").setup(opts)
	-- 	end,
	-- },
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
		"stevearc/conform.nvim", -- Formatter
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = require("plugins.configs.conform"),
	},
	{
		"mfussenegger/nvim-lint", -- Linter
		event = { "BufReadPre", "BufNewFile" },
		config = require("plugins.configs.nvim-lint"),
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Auto-install formatters/linters via Mason
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = require("utils.lsp").ensure_installed_tools,
			})
		end,
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
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.dotenv = {
				install_info = {
					url = "https://github.com/pnx/tree-sitter-dotenv",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "main",
				},
				filetype = "dotenv",
			}
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- TypeScript Support
	{
		"pmizio/typescript-tools.nvim", -- TypeScript-specific tools
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("typescript-tools").setup({
				capabilities = capabilities,
				settings = {
					complete_function_calls = true, -- Enable snippet-style function completions
					include_completions_with_insert_text = true,
				},
			})
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
	-- Rust Support
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		ft = { "rust" },
		config = function()
			vim.g.rustaceanvim = {
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				server = {
					on_attach = function(_, bufnr)
						vim.keymap.set("n", "<leader>ca", function()
							vim.cmd.RustLsp("codeAction")
						end, { desc = "Rust code action", buffer = bufnr })
						vim.keymap.set("n", "<leader>rr", function()
							vim.cmd.RustLsp("runnables")
						end, { desc = "Rust runnables", buffer = bufnr })
						vim.keymap.set("n", "<leader>rt", function()
							vim.cmd.RustLsp("testables")
						end, { desc = "Rust testables", buffer = bufnr })
						vim.keymap.set("n", "<leader>re", function()
							vim.cmd.RustLsp("explainError")
						end, { desc = "Rust explain error", buffer = bufnr })
						vim.keymap.set("n", "<leader>rm", function()
							vim.cmd.RustLsp("expandMacro")
						end, { desc = "Rust expand macro", buffer = bufnr })
						vim.keymap.set("n", "K", function()
							vim.cmd.RustLsp({ "hover", "actions" })
						end, { desc = "Rust hover actions", buffer = bufnr })
					end,
					default_settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
			}
		end,
	},
}
