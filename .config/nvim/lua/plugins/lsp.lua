require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = require("config.tools").packages,
  auto_update = false,
  run_on_start = vim.env.HEADLESS_NEOVIM ~= "1",
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities({
    workspace = { fileOperations = { didRename = true, willRename = true } },
  }),
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim", "MiniIcons", "Snacks" } },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("yamlls", { settings = { yaml = { keyOrdering = false } } })
vim.lsp.enable({ "lua_ls", "vtsls", "pyright", "bashls", "jsonls", "yamlls", "marksman" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DotfilesLsp", { clear = true }),
  callback = function(event)
    local map = function(lhs, rhs, desc, mode)
      vim.keymap.set(mode or "n", lhs, rhs, { buffer = event.buf, desc = desc })
    end
    map("gd", Snacks.picker.lsp_definitions, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("gr", Snacks.picker.lsp_references, "References")
    map("gI", Snacks.picker.lsp_implementations, "Implementations")
    map("gy", Snacks.picker.lsp_type_definitions, "Type definitions")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("<C-k>", vim.lsp.buf.signature_help, "Signature help", "i")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
    map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
  end,
})
