require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.colorcolumn = "80,120"
o.relativenumber = true
o.wrap = true
o.cursorline = true

-- native inline completions aren't supported
vim.g.ai_cmp = false

-- Gruvbox colors for window separators and UI elements
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#504945", bg = "NONE" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3c3836" })
