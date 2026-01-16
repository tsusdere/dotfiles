require("nvchad.configs.lspconfig").defaults()

local lspconfig = require('lspconfig')
local nvlsp = require ("nvchad.configs.lspconfig")

local servers = { "html", "cssls", "gopls", "rust_analyzer"}
vim.lsp.enable(servers)

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- read :h vim.lsp.config for changing options of lsp servers 
