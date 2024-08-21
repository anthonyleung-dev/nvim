return function()
	local present, null_ls = pcall(require, "null-ls")

	if not present then
		return
	end

	local b = null_ls.builtins

	local sources = {

		-- webdev stuff
		b.formatting.prettier.with({
			filetypes = { "html", "markdown", "css", "javascript", "typescript" }, -- Add relevant filetypes
		}),

		-- Lua
		b.formatting.stylua,

		-- Python
		-- b.formatting.autopep8.with({ filetypes = { "python" } }),

		-- Lua
		b.formatting.stylua,

		-- PHP
		-- b.formatting.intelephense,

		-- Shell
		b.formatting.shfmt,
		-- b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

		-- b.code_actions.xo,
		-- b.code_actions.gitsigns,
	}

	null_ls.setup({
		debug = true,
		sources = sources,
	})
end
