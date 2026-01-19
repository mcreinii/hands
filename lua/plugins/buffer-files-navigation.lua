return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {},
	keys = {
		-- Files
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart pick",
		},

		-- Fast navigations
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},

		-- Diagnostics
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Workspace Diagnostics",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},

		-- Git
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},

		-- Helpers
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},

		-- Managing
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},

		-- Buffers
		{
			"<leader>C",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete buffers except current",
		},
		{
			"<leader>c",
			function()
				Snacks.bufdelete.delete()
			end,
			desc = "Delete buffer",
		},
	},
}
