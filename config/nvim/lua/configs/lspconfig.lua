
local lspconfig = require('lspconfig')
local nvlsp = require ("nvchad.configs.lspconfig")

local servers = { "html", "cssls", "copilot", "gopls", "rust_analyzer"}
vim.lsp.enable(servers)

vim.keymap.set("i", "jj", function()
    require("copilot.suggestion").accept()
end, { desc = "Accept Copilot suggestion", silent = true })

-- read :h vim.lsp.config for changing options of lsp servers 
