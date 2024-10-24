-- In your init.lua or wherever you setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none", -- shallow clone
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		import = "pranav.plugins",
	},
}, {
	checker = {
		enabled = true,
		notify = false,
	},

	change_detection = {
		enabled = true,
		notify = false,
	},

	cache = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/lazy/cache",
	},
})
