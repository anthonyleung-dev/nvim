vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set the colorscheme
-- vim.opt.background = "dark"
vim.opt.termguicolors = true

-- vim.cmd("colorscheme onedark")
-- Enable line numbers
vim.opt.number = true

-- Disable relative line numbers (show absolute only)
vim.opt.relativenumber = false

vim.opt.clipboard = "unnamedplus"

-- Enable mouse support for resizing splits
vim.opt.mouse = "a"

-- Performance
vim.opt.lazyredraw = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttyfast = true

-- Set the colorscheme
-- vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })
-- vim.fn.sign_define("DiagnosticSignHint", { text = "💡", texthl = "DiagnosticSignHint", numhl = "" })

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
		source = "always",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "💡",
		},
	},
})

-- Filetype detection for .env files
vim.filetype.add({
	filename = {
		[".env"] = "dotenv",
		[".env.local"] = "dotenv",
		[".env.development"] = "dotenv",
		[".env.production"] = "dotenv",
		[".env.test"] = "dotenv",
		[".env.example"] = "dotenv",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})

-- Workaround Telescope highlights bug: https://is.gd/Sjxegs
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.opt_local.splitkeep = "cursor"
	end,
	group = augroup("TelescopePluginEvents", {}),
})
