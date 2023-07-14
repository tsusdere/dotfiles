require("tsusdere.packer")

if not vim.env.HEADLESS_NEOVIM then
  require("tsusdere.remap")
  require("tsusdere.set")
end
