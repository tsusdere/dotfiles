return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "savq/melange-nvim" },
	{ "Shatur/neovim-ayu" },
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
