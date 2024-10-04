local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lsp" },
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "elixir", "eex", "heex" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
})

require("config.options")
require("config.keymaps")
require("oil").setup()
-- vim.cmd([[colorscheme solarized-osaka]])
--
vim.cmd([[
    highlight DashboardHeader guifg=#E06C75
    highlight DashboardIcon guifg=#F16373
    highlight DashboardDesc guifg=#3FB1F6
    highlight DashboardKey guifg=#E5C07B
    highlight DashboardFooter guifg=#98C379
]])
vim.cmd("colorscheme cyberdream")
-- vim.cmd("colorscheme onedark_dark")
--
-- for macros
require("lualine").setup({
	sections = {
		lualine_x = {
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
		},
	},
})
