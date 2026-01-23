local dap, dapui = require "dap", require "dapui"

require("dapui").setup()
require("dap-go").setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<Leader>dt", ":DapUiToggle<CR>", {})
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", {})

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
