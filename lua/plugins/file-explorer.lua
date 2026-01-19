--- @type LazySpec
return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sources = {
			"filesystem",
		},
		enable_git_status = false,
		enable_diagnostics = false,
		git_status_sync = false,
		enable_cursor_hijack = true,
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	keys = {
		{ "<leader>e", ":Neotree toggle<CR>", desc = "Open Neo-Tree", silent = true, noremap = true },
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Open Neo-Tree when no buffer on start.
		if vim.fn.argc(-1) == 0 then
			vim.cmd("Neotree focus")
		end
	end,
}
