return function()
	local present, conform = pcall(require, "conform")

	if not present then
		return
	end

	conform.setup({
		formatters_by_ft = {
			-- Web development
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			graphql = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },

			-- Lua
			lua = { "stylua" },

			-- Rust (uses rust-analyzer LSP, but can fallback to rustfmt)
			rust = { "rustfmt", lsp_format = "fallback" },

			-- Python
			python = { "autopep8" },

			-- Shell
			sh = { "shfmt" },
			bash = { "shfmt" },

			-- PHP
			php = { "pint", "php_cs_fixer", stop_after_first = true },
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},

		-- Disable format_on_save for specific filetypes
		-- format_on_save = function(bufnr)
		-- 	local ignore_filetypes = { "sql", "java" }
		-- 	if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
		-- 		return
		-- 	end
		-- 	return {
		-- 		timeout_ms = 500,
		-- 		lsp_format = "fallback",
		-- 	}
		-- end,
	})
end
