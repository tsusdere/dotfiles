return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      local colors = require("gruvbox").palette
      local inactive_bg = colors.dark0
      local active_bg = colors.dark1

      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        numbers = "ordinal",
        separator_style = "thin",
        indicator = {
          icon = "▎",
          style = "icon",
        },
        modified_icon = "●",
        show_close_icon = false,
        enforce_regular_tabs = true,
        max_name_length = 24,
        tab_size = 20,
        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" },
        },
      })

      opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, {
        fill = { bg = inactive_bg },
        background = { fg = colors.dark4, bg = inactive_bg },
        buffer_visible = { fg = colors.light4, bg = inactive_bg },
        buffer_selected = {
          fg = colors.light1,
          bg = active_bg,
          bold = true,
          italic = false,
        },
        numbers = { fg = colors.dark4, bg = inactive_bg },
        numbers_visible = { fg = colors.light4, bg = inactive_bg },
        numbers_selected = {
          fg = colors.bright_yellow,
          bg = active_bg,
          bold = true,
          italic = false,
        },
        indicator_selected = { fg = colors.bright_yellow, bg = active_bg },
        modified = { fg = colors.bright_orange, bg = inactive_bg },
        modified_visible = { fg = colors.bright_orange, bg = inactive_bg },
        modified_selected = { fg = colors.bright_orange, bg = active_bg },
        close_button = { fg = colors.dark4, bg = inactive_bg },
        close_button_visible = { fg = colors.light4, bg = inactive_bg },
        close_button_selected = { fg = colors.bright_red, bg = active_bg },
        separator = { fg = colors.dark0, bg = inactive_bg },
        separator_visible = { fg = colors.dark0, bg = inactive_bg },
        separator_selected = { fg = colors.bright_yellow, bg = active_bg },
        tab = { fg = colors.dark4, bg = inactive_bg },
        tab_selected = { fg = colors.light1, bg = active_bg, bold = true },
        tab_separator = { fg = colors.dark0, bg = inactive_bg },
        tab_separator_selected = { fg = colors.bright_yellow, bg = active_bg },
      })
    end,
  },
}
