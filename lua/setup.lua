vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set the colorscheme
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- vim.cmd("colorscheme onedark")
-- Enable line numbers
vim.opt.number = true

-- Optionally, enable relative line numbers
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

-- Set the colorscheme
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "💡", texthl = "DiagnosticSignHint", numhl = "" })

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
		source = "always",
	},
})

-- Coplilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
