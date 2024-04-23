-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local discipline = require("tsusdere.discipline")
local harpoon = require("harpoon")
discipline.cowboy()
harpoon:setup()

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")

-- help move line
keymap.set("n", "<C-k>", ":m .-2<CR>==")
keymap.set("n", "<C-j>", ":m .+1<CR>==")

-- harpoon
keymap.set("n", "<leader>h", function()
  harpoon:list():append()
end)
keymap.set("n", "<leader>H", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap.set("n", "<C-1>", function()
  harpoon:list():select(1)
end)
keymap.set("n", "<C-2>", function()
  harpoon:list():select(2)
end)
keymap.set("n", "<C-3>", function()
  harpoon:list():select(3)
end)
keymap.set("n", "<C-4>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)


-- Go to explorer
keymap.set("n", "<Leader>pv", function()
  vim.cmd.Ex()
end, opts)
