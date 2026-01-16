require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- split window
map("n", "<leader>ss", ":split<Return>" )
map("n", "<leader>sv", ":vsplit<Return>")

-- close a window
map("n", "<leader>q", ":q<Return>")

-- help move line
map("n", "<C-k>", ":m .-2<CR>==")
map("n", "<C-j>", ":m .+1<CR>==")

-- quick way out of noh
map("n", "<Leader>n", "<cmd>nohlsearch<CR>")

-- save file
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
