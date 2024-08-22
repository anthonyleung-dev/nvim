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
