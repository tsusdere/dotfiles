return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		opts = {
			render = "background",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_hsl_without_function = true,
			enable_ansi = true,
			enable_var_usage = true,
			enable_tailwind = true,
		},
	},

	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			explorer = {
				enabled = true,
				replace_netrw = true,
				trash = true,
			},
			picker = {
				sources = {
					explorer = {
						layout = { preset = "sidebar", preview = false },
					},
				},
			},

			layout = {
				sidebar = { position = "right" },
			},
		},
	},
}
