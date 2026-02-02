return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				transparent = true,
			},
		},
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.sonokai_transparent_background = 2
		end,
	},
	{
		"nikolvs/vim-sunbather",
		priority = 1000,
	},
	{
		"L-Colombo/oldschool.nvim",
		priority = 1000,
		opts = {},
	},
	{
		"thallada/farout.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"projekt0n/caret.nvim",
		priority = 1000,
	},
}
