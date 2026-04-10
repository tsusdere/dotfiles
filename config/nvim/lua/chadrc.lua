-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

  transparency = true,
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
    modules = {
      buffers = function()
        local api = vim.api
        local txt = require("nvchad.tabufline.utils").txt
        local style_buf = require("nvchad.tabufline.utils").style_buf
        local cur_buf = api.nvim_get_current_buf
        local bw = require("nvconfig").ui.tabufline.bufwidth
        local max_bufs = 3

        local buffers = {}
        local has_current = false

        vim.t.bufs = vim.tbl_filter(api.nvim_buf_is_valid, vim.t.bufs)

        for i, nr in ipairs(vim.t.bufs) do
          if #buffers >= max_bufs then
            if has_current then
              break
            end
            table.remove(buffers, 1)
          end

          has_current = cur_buf() == nr or has_current
          table.insert(buffers, style_buf(nr, i, bw))
        end

        return table.concat(buffers) .. txt("%=", "Fill")
      end,
    },
  },
}

return M
