require("blink.cmp").setup({
  keymap = { preset = "enter", ["<C-y>"] = { "select_and_accept" } },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
    ghost_text = { enabled = false },
  },
  cmdline = { enabled = true },
  fuzzy = { implementation = "lua" },
})

require("mini.pairs").setup()
require("mini.diff").setup()
require("gitsigns").setup()
require("gitlinker").setup()
require("todo-comments").setup()
require("nvim-highlight-colors").setup({ render = "background" })

local prettier = { "prettierd", "prettier", stop_after_first = true }
require("conform").setup({
  default_format_opts = { lsp_format = "fallback", timeout_ms = 3000 },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    yaml = prettier,
    markdown = prettier,
    html = prettier,
    css = prettier,
  },
  format_on_save = function(buf)
    if not vim.b[buf].disable_autoformat then
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end
  end,
})

vim.api.nvim_create_user_command("ToggleFormatter", function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  vim.notify("Format on save: " .. (vim.b.disable_autoformat and "off" or "on"))
end, { desc = "Toggle format on save for this buffer" })

require("oil").setup({
  columns = { "icon", "permissions", "size", "mtime" },
  keymaps = {
    ["h"] = { "actions.parent", mode = "n" },
    ["q"] = { "actions.close", mode = "n" },
  },
  view_options = { show_hidden = true },
  float = { border = "rounded" },
})

require("copilot").setup({
  should_attach = function()
    return vim.env.HEADLESS_NEOVIM ~= "1"
  end,
  panel = { enabled = false },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-l>",
      accept_word = "<M-l>",
      accept_line = "<M-S-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = { markdown = true },
})
