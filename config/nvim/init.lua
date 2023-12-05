require("tsusdere.packer")

if not vim.env.HEADLESS_NEOVIM then
  require("tsusdere.remap")
  require("tsusdere.set")
  local null_ls = require("null-ls")

  null_ls.setup({
      sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
      },
  })
end
