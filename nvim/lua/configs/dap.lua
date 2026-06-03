require("mason").setup()
require("mason-nvim-dap").setup()

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
