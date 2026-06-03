require "nvchad.autocmds"

local function set_custom_highlights()
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#ffffff" })

  -- Make tabline transparent to match editor background
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(set_custom_highlights)
  end,
})
set_custom_highlights()
