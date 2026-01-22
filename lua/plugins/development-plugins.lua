return {
	dir = vim.fn.expand("~/.config/modern-nvim/lua/floating-terminal/"),
	opts = {},
	config = function(_, opts)
		require("floating-terminal").setup(opts)
	end,
	keys = {
		{ "<leader>tf", ":HandsTerminal floating<CR>", desc = "Open floating", silent = true, noremap = true },
	},
}
