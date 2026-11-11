local group = vim.api.nvim_create_augroup("Dotfiles", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  group = group,
  callback = function()
    vim.wo.cursorline = vim.bo.buftype == ""
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = group,
  callback = function()
    vim.wo.cursorline = false
  end,
})

vim.filetype.add({ extension = { mdx = "markdown", mjml = "html" } })
