-- Key mappings for telescope
local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Key mappings for buffer topbar
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)
-- Format code
vim.keymap.set("n", "<leader>p", ":Neoformat<CR>", {})

-- Nerd Commenter
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
vim.keymap.set(
	"v",
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ noremap = true, silent = true }
)

-- Rename
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Remap Cmd+C and Cmd+V in insert mode
vim.keymap.set("i", "<D-c>", '<C-o>"+y', { noremap = true, silent = true })
vim.keymap.set("i", "<D-v>", '<C-o>"+p', { noremap = true, silent = true })

-- Remap Cmd+C and Cmd+V in normal mode for consistency
vim.keymap.set("n", "<D-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true })

-- Terminal
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })

-- -- Key mappings for quickly toggling nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- Key mappings for quickly toggling Neotest
vim.keymap.set("n", "<leader>tra", "<cmd>Neotest run<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run file<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotest stop<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ta", "<cmd>Neotest attach<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<CR>", { noremap = true, silent = true })

-- Normal mode mappings
vim.keymap.set("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "LSP declaration", unpack(opts) })

vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "LSP definition", unpack(opts) })

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "LSP hover", unpack(opts) })

vim.keymap.set("n", "gi", function()
	vim.lsp.buf.implementation()
end, { desc = "LSP implementation", unpack(opts) })

vim.keymap.set("n", "<leader>ls", function()
	vim.lsp.buf.signature_help()
end, { desc = "LSP signature help", unpack(opts) })

vim.keymap.set("n", "<leader>D", function()
	vim.lsp.buf.type_definition()
end, { desc = "LSP definition type", unpack(opts) })

vim.keymap.set("n", "gr", function ()
	vim.lsp.buf.references({ includeDeclaration = true })
end, { desc = "LSP references", unpack(opts) })

vim.keymap.set("n", "<leader>lf", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostic", unpack(opts) })

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, { desc = "Goto prev", unpack(opts) })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, { desc = "Goto next", unpack(opts) })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist", unpack(opts) })

vim.keymap.set("n", "<leader>wa", function()
	vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder", unpack(opts) })

vim.keymap.set("n", "<leader>wr", function()
	vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder", unpack(opts) })

vim.keymap.set("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders", unpack(opts) })

-- Key mappings for supermaven-nvim
local completion_preview = require("supermaven-nvim.completion_preview")
vim.keymap.set("i", "<C-a>", completion_preview.on_accept_suggestion, { noremap = true, silent = true })
-- vim.keymap.set("i", "<S-space>", completion_preview.on_accept_suggestion_word, { noremap = true, silent = true })
