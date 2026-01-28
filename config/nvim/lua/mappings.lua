require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- split window
map("n", "wh", ":split<Return>" )
map("n", "wv", ":vsplit<Return>")

-- close a window
map("n", "<leader>q", ":q<Return>")

-- help move line
map("n", "<C-q>", ":m .-2<CR>==")
map("n", "<C-a>", ":m .+1<CR>==")

-- quick way out of noh
map("n", "<Leader>n", "<cmd>nohlsearch<CR>")

-- save file
map({ "n", "i", "v" }, "ZZ", "<Esc> <cmd> w <cr>")

-- force quit all windows
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "force quit all" })

-- toggleable
map({ "n", "t" }, "<C-;>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
