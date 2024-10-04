return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			lightbulb = {
				virtual_text = false,
			},
			ui = {
				code_action = "󱧢",
			},
		})
	end,
}

