return {
	{
		"AckslD/nvim-neoclip.lua",
		cmd = "Telescope",
		dependencies = {
			-- you'll need at least one of these
			-- {'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cmd = "Telescope",
	},

	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		keys = {
			{
				"<leader>lg",
				function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
				desc = "Live Grep with Arguments",
			},
		},
	},

	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
		},
		keys = {
			{ "<leader>gs", "<cmd>AdvancedGitSearch<CR>", desc = "Advanced Git Search" },
		},
	},

	{ "nanotee/zoxide.vim", cmd = "Telescope" },

	{
		"nvim-telescope/telescope-ui-select.nvim",
		cmd = "Telescope",
	},

	{
		"debugloop/telescope-undo.nvim",
		keys = {
			{ "<leader>u", "<cmd>Telescope undo<CR>", desc = "Undo History" },
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help Tags" },
			{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Find Word under Cursor" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Search Git Commits" },
			{ "<leader>gb", "<cmd>Telescope git_bcommits<CR>", desc = "Search Git Commits for Buffer" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps" },
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
						layout_config = { width = 0.7 },
					}))
				end,
				desc = "[/] Fuzzily search in current buffer",
			},
		},
	},
}
