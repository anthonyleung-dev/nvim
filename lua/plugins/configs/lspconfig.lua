local lspconfig = require("lspconfig")
local lsp = require("utils.lsp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP key mappings and on_attach function
local on_attach = function(client, bufnr)
	-- Enable go-to-definition
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gd",
		"<cmd>Telescope lsp_definitions<cr>",
		{ noremap = true, silent = true, desc = "Go to definition" }
	)
end

-- Loop through each LSP server in the ensure_installed list and set it up
for _, server in ipairs(lsp.ensure_installed) do
	if server == "lua_ls" then
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths here.
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
					diagnostics = { globals = { "vim" } },
				})
			end,
			settings = {
				Lua = {},
			},
			on_attach = on_attach,
		})
	elseif server == "jsonls" then
		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})
	else
		lspconfig[server].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end
end
