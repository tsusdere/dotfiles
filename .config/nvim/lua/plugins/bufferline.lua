return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      local colors = require("tokyonight.colors").setup()
      local inactive_bg = colors.bg_dark
      local active_bg = colors.bg_highlight

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
        background = { fg = colors.comment, bg = inactive_bg },
        buffer_visible = { fg = colors.fg_dark, bg = inactive_bg },
        buffer_selected = {
          fg = colors.fg,
          bg = active_bg,
          bold = true,
          italic = false,
        },
        numbers = { fg = colors.comment, bg = inactive_bg },
        numbers_visible = { fg = colors.fg_dark, bg = inactive_bg },
        numbers_selected = {
          fg = colors.yellow,
          bg = active_bg,
          bold = true,
          italic = false,
        },
        indicator_selected = { fg = colors.yellow, bg = active_bg },
        modified = { fg = colors.orange, bg = inactive_bg },
        modified_visible = { fg = colors.orange, bg = inactive_bg },
        modified_selected = { fg = colors.orange, bg = active_bg },
        close_button = { fg = colors.comment, bg = inactive_bg },
        close_button_visible = { fg = colors.fg_dark, bg = inactive_bg },
        close_button_selected = { fg = colors.red, bg = active_bg },
        separator = { fg = colors.bg, bg = inactive_bg },
        separator_visible = { fg = colors.bg, bg = inactive_bg },
        separator_selected = { fg = colors.yellow, bg = active_bg },
        tab = { fg = colors.comment, bg = inactive_bg },
        tab_selected = { fg = colors.fg, bg = active_bg, bold = true },
        tab_separator = { fg = colors.bg, bg = inactive_bg },
        tab_separator_selected = { fg = colors.yellow, bg = active_bg },
      })
    end,
  },
}
