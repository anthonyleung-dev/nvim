return function()
	local mason_lspconfig = require("mason-lspconfig")
	local ensure_installed = require("utils.lsp").ensure_installed

	mason_lspconfig.setup({
		ensure_installed = ensure_installed,
		automatic_installation = true,
	})
end
