return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      transparent = true,
      styles = {
        transparency = true,
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "rebelot/kanagawa.nvim", transparent = true },
  { "ayu-theme/ayu-vim", transparent_mode = true },
  { "aktersnurra/no-clown-fiesta.nvim", transparent = true },
  {
    "arturgoms/moonbow.nvim",
    opts = {
      transparent_mode = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
