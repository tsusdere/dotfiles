require("solarized-osaka").setup({ style = "vivid", transparent = true })
vim.cmd.colorscheme("solarized-osaka")

require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

require("snacks").setup({
  indent = { enabled = true },
  picker = {
    enabled = true,
    sources = {
      files = { hidden = true },
      grep = { hidden = true },
    },
  },
  notifier = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  lazygit = { enabled = true },
})

require("lualine").setup({
  options = { theme = "auto", globalstatus = true },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "diagnostics", "diff", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = {
      {
        "tabs",
        mode = 2,
        max_length = vim.o.columns,
        tabs_color = {
          active = "lualine_a_normal",
          inactive = "lualine_b_inactive",
        },
      },
    },
  },
})

require("incline").setup({
  window = { margin = { horizontal = 1, vertical = 0 } },
  hide = { cursorline = "smart" },
  render = function(props)
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    name = name ~= "" and name or "[No Name]"
    local icon, highlight = MiniIcons.get("file", name)
    return {
      { icon, group = highlight },
      " ",
      (vim.bo[props.buf].modified and "[+] " or "") .. name,
    }
  end,
})

require("trouble").setup()
require("codediff").setup({ explorer = { view_mode = "tree" } })

vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, source = "if_many" },
  float = { source = true },
})
