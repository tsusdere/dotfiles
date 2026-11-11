local repositories = {
  "craftzdog/solarized-osaka.nvim",
  "nvim-mini/mini.icons",
  "folke/snacks.nvim",
  "folke/trouble.nvim",
  "nvim-lualine/lualine.nvim",
  "b0o/incline.nvim",
  "esmuellert/codediff.nvim",
  "stevearc/conform.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-mini/mini.pairs",
  "nvim-mini/mini.diff",
  "folke/todo-comments.nvim",
  "lewis6991/gitsigns.nvim",
  "linrongbin16/gitlinker.nvim",
  "brenoprata10/nvim-highlight-colors",
  "neovim/nvim-lspconfig",
  "mason-org/mason.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  "stevearc/oil.nvim",
  "zbirenbaum/copilot.lua",
}

local packages = vim.tbl_map(function(repository)
  return { src = "https://github.com/" .. repository }
end, repositories)
packages[#packages + 1] = {
  src = "https://github.com/saghen/blink.cmp",
  version = vim.version.range("^1"),
}
vim.pack.add(packages, { confirm = false })

require("plugins.ui")
require("plugins.editor")
require("plugins.lsp")
require("plugins.treesitter")

vim.api.nvim_create_user_command("PluginUpdate", function()
  vim.pack.update()
end, { desc = "Review native package updates; write to apply" })
