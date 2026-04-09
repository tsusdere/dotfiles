require "nvchad.autocmds"

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#ffffff" })
    end)
  end,
})
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#ffffff" })
