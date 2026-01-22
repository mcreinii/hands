local valid_border_styles = {
	none = true,
	single = true,
	double = true,
	rounded = true,
	solid = true,
	shadow = true,
}

local function get_border_style()
	local border = vim.o.winborder
	if border == nil or border == "" or not valid_border_styles[border] then
		return "double"
	end
	return border
end

local function above_statusline()
	return vim.api.nvim_win_get_height(0) - 1
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local border_style = get_border_style()

		require("noice").setup({
			notify = {
				enabled = false,
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
					position = {
						row = above_statusline(),
						col = 0,
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = { style = border_style },
				},

				popupmenu = {
					relative = "editor",
					border = { style = border_style },
				},

				popup = { border = { style = border_style } },
				code_action = { border = { style = border_style } },
				confirm = { border = { style = border_style } },
				split = { border = { style = border_style } },
				vsplit = { border = { style = border_style } },

				mini = {
					border = { style = border_style },
					position = {
						row = above_statusline(),
						col = "100%",
					},
				},
			},
		})
	end,
}
