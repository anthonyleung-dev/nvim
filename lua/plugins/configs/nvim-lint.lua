return function()
	local present, lint = pcall(require, "lint")

	if not present then
		return
	end

	lint.linters_by_ft = {
		-- Shell
		sh = { "shellcheck" },
		bash = { "shellcheck" },

		-- JavaScript/TypeScript (if using eslint)
		-- javascript = { "eslint" },
		-- typescript = { "eslint" },
		-- javascriptreact = { "eslint" },
		-- typescriptreact = { "eslint" },

		-- Python
		-- python = { "pylint" },
	}

	-- Auto-lint on events
	vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
		callback = function()
			lint.try_lint()
		end,
	})
end
