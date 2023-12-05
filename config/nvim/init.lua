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

    -- Defines a read-write directory for treesitters in nvim's cache dir
  local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
  vim.fn.mkdir(parser_install_dir, "p")
  -- Prevents reinstall of treesitter plugins every boot
  vim.opt.runtimepath:append(parser_install_dir)

  -- In your treesitter config,
  require('nvim-treesitter.configs').setup {
    -- ...
    parser_install_dir = parser_install_dir
  }
end
