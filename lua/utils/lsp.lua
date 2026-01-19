local M = {}

M.ensure_installed = {
	"intelephense",
	"pyright",
	"bashls",
	"rust_analyzer",
	"jdtls",
	"marksman",
	"graphql",
	"sqlls",
	"solidity",
	"cssls",
	"html",
	-- "volar",
	"dockerls",
	"yamlls",
	"lemminx",
	"jsonls",
	"tailwindcss",
	"lua_ls",
	"prismals",
}

-- Formatters and linters for mason-tool-installer
M.ensure_installed_tools = {
	"prettierd",
	"stylua",
	"shfmt",
	"shellcheck",
	"autopep8",
	"taplo",
	"dotls"
}

return M
