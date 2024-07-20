return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        transparent_background_level = 1,
      })
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
