-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tsusdere.packer")

if not vim.env.HEADLESS_NEOVIM then
  require("tsusdere.remap")
  require("tsusdere.set")
end
