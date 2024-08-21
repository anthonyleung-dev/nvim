return function()
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")
	local ensure_installed = require("utils.lsp").ensure_installed

	mason_lspconfig.setup({
		ensure_installed = ensure_installed,
        automatic_installation = true,
	})

	-- Automatically setup installed LSP servers
	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({})
		end,
	})
end
