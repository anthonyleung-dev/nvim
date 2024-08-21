-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "onedark", "nordic", "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Define your config files pattern
local config_files = {
	"~/.config/nvim/init.lua",
	"~/.config/nvim/lua/**/*.lua",
	-- Add more config files or patterns as needed
}

-- Function to reload Neovim config
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^user_config") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
	print("Configuration reloaded!")
end

-- Autocommand to reload Neovim config on save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = config_files,
	callback = function()
		_G.ReloadConfig()
	end,
})
