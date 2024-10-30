return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader><leader>a",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Harpoon: Mark File",
		},
		{
			"<leader><leader>e",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle Harpoon Menu",
		},
		{
			"<leader><leader>h",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Harpoon File 1",
		},
		{
			"<leader><leader>j",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Harpoon File 2",
		},
		{
			"<leader><leader>k",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Harpoon File 3",
		},
		{
			"<leader><leader>l",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Harpoon File 4",
		},
	},
}
