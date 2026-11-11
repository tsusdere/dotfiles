if vim.fn.has("nvim-0.12") == 0 then
  error("This configuration requires Neovim 0.12 or newer")
end

vim.loader.enable()
require("config.options")
require("config.autocmds")
require("plugins")
require("config.keymaps")
