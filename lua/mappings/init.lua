-- Key mappings for telescope
local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Key mappings for buffer topbar
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
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
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- Remap Cmd+C and Cmd+V in insert mode
vim.keymap.set("i", "<D-c>", '<C-o>"+y', { noremap = true, silent = true })
vim.keymap.set("i", "<D-v>", '<C-o>"+p', { noremap = true, silent = true })

-- Remap Cmd+C and Cmd+V in normal mode for consistency
vim.keymap.set("n", "<D-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true })

-- -- Copilot
-- vim.keymap.set("i", "<S-Space>", 'copilot#Accept("\\<CR>")', {
-- 	expr = true,
-- 	replace_keycodes = false,
-- })

-- Terminal
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })

-- -- Key mappings for quickly toggling nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- Key mappings for quickly toggling neotest
vim.keymap.set("n", "<leader>tra", "<cmd>Neotest run<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run file<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotest stop<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ta", "<cmd>Neotest attach<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fr', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
