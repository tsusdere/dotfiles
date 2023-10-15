function Color(color)
	color = color or 'catppuccin'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { background = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { background = "none" })
end

Color()
