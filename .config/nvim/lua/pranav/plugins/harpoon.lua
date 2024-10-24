return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Harpoon: Mark File",
		},
		{
			"<C-e>",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle Harpoon Menu",
		},
		{
			"<M-1>",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Harpoon File 1",
		},
		{
			"<M-2>",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Harpoon File 2",
		},
		{
			"<M-3>",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Harpoon File 3",
		},
		{
			"<M-4>",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Harpoon File 4",
		},
	},
}
