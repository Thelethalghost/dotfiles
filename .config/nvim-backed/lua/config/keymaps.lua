vim.g.mapleader = " "
-- Move selected lines with shift+j or shift+k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join line while keeping the cursor in the same position
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centred while scrolling up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Next and previous instance of the highlighted letter
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Fixed ctrl+c weirdness to exit from vertical select mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Delete shift+q keymap
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace current position word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-/>", "<cmd>noh<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Neo Tree
vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<CR>", { desc = "Toggle NvimTree" })

vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", "<Cmd>Oil<CR>", { desc = "Open Oil" })
vim.keymap.set('n',"<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "go left"})
vim.keymap.set('n',"<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "go down"})
vim.keymap.set('n',"<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", {desc = "go up"})
vim.keymap.set('n',"<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", { desc = "go right"})
vim.keymap.set('n',"<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", {desc = "go prev"}) 
