return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {},
	keys = {
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
