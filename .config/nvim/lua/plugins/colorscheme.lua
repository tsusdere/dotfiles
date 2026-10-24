return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = "dark"
    end,
    opts = {
      transparent_mode = true,
      overrides = {
        NormalFloat = { bg = "NONE" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
