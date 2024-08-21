return function()
	-- cmp.lua

	local cmp = require("cmp")
	local lspkind = require("lspkind")
	-- Utility function to check for words before the cursor
	local has_words_before = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
	end
	cmp.setup({})
	-- Set up nvim-cmp
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		performance = { max_view_entries = 20 },
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol", -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				show_labelDetails = true, -- show labelDetails in menu. Disabled by default
				symbol_map = { supermaven = "" },
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
			["<Tab>"] = cmp.mapping(function(fallback)
				local luasnip = require("luasnip")
				local suggestion = require("supermaven-nvim.completion_preview")

				if luasnip.expandable() then
					luasnip.expand()
				elseif suggestion.has_suggestion() then
					suggestion.on_accept_suggestion()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
			{ name = "supermaven" },
			-- { name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "treesitter" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
		}),
	})
end
