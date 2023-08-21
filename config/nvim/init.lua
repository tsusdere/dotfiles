require("tsusdere.packer")

if not vim.env.HEADLESS_NEOVIM then
  require("tsusdere.remap")
  require("tsusdere.set")
  require("nvim-tree").setup()
  local null_ls = require("null-ls")

  null_ls.setup({
      sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
      },
  })
  require("orgmode").setup_ts_grammar()
  require('orgmode').setup({
    org_agenda_files = {'~/org/*'},
    org_default_notes_file = '~/org/refile.org',
  })

end
