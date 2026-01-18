
local lspconfig = require('lspconfig')
local nvlsp = require ("nvchad.configs.lspconfig")

local servers = { "html", "cssls", "gopls", "rust_analyzer"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
