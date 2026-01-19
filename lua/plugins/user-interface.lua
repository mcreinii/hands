function above_statusline()
	return vim.api.nvim_win_get_height(0) - 1
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		notify = {
			enabled = false, -- disable nvim-notify
		},
		cmdline = {
			view = "cmdline_popup",
		},
		presets = {
			bottom_search = false,
			command_palette = true,
		},
		views = {
			cmdline_popup = {
				position = { row = above_statusline(), col = 0 },
				size = { width = 60, height = "auto" },
				border = { style = "single" },
			},
			popupmenu = {
				relative = "editor",
				border = { style = "single" },
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
			popup = { border = { style = "single" } },
			code_action = { border = { style = "single" } },
			confirm = { border = { style = "single" } },
			split = { border = { style = "single" } },
			vsplit = { border = { style = "single" } },
			mini = {
				border = { style = "single" },
				position = {
					row = above_statusline(), -- 1 row above the bottom (statusline)
					col = "100%", -- bottom-right corner
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
