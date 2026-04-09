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
