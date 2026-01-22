local conditions = {
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local mode_colors = {
	n = { fg = "#121212", bg = "#98c379" }, -- Normal Mode (Green)
	i = { fg = "#121212", bg = "#61afef" }, -- Insert Mode (Blue)
	ic = { fg = "#121212", bg = "#61afef" }, -- Insert Mode with completion (Blue)
	v = { fg = "#121212", bg = "#c678dd" }, -- Visual Mode (Purple)
	V = { fg = "#121212", bg = "#c678dd" }, -- Visual Mode (Line)
	["\22"] = { fg = "#121212", bg = "#c678dd" }, -- Visual Mode (Block)
	R = { fg = "#121212", bg = "#d19a66" }, -- Replace Mode (Orange)
	c = { fg = "#121212", bg = "#e06c75" }, -- Command Mode (Red)
	t = { fg = "#121212", bg = "#56b6c2" }, -- Terminal Mode (Cyan)
	no = { fg = "#121212", bg = "#d19a66" }, -- Operator-pending Mode (Orange)
	niI = { fg = "#121212", bg = "#98c379" }, -- Normal Insert-pending Mode (Green)
	niR = { fg = "#121212", bg = "#d19a66" }, -- Normal Replace-pending Mode (Orange)
}

local left_modules = {
	{
		-- Modes
		function()
			return vim.fn.mode()
		end,
		color = function()
			return mode_colors[vim.fn.mode()]
		end,
	},
	{
		-- Filetype
		"filetype",
	},
	{
		-- Filename
		function()
			local buf_name = vim.api.nvim_buf_get_name(0)

			-- Check if the buffer name matches both "neo-tree" and "filesystem"
			if buf_name:match("neo%-tree") and buf_name:match("filesystem") then
				return ""
			end

			return vim.fn.expand("%:h:t") .. "/" .. vim.fn.expand("%:t")
		end,
		path = 2,
		shorting_target = 20,
		symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
	},
	{
		-- Git branch
		"branch",
		icon = " ",
	},
	{
		-- Git diff
		"diff",

		symbols = { added = " ", modified = "󰝤 ", removed = " " },
		conditions = conditions.hide_in_width(),
	},
	{
		-- Diagnostics
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
	},
}

local right_modules = {
	{
		-- Language Server Protocol
		function()
			local output = ""
			local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })

			local clients = vim.lsp.get_clients()

			for _, client in pairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					output = output .. ", " .. client.name
				end
			end

			return string.sub(output, 3)
		end,
	},
	{
		-- Progress
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local icons = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }

			local line_ratio = current_line / total_lines

			local index = math.ceil(line_ratio * #icons)

			return icons[index]
		end,
		padding = { left = 1, right = 0 },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			component_separators = { left = "", right = "" },
		},
		sections = (function()
			local sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}

			for _, module in pairs(left_modules) do
				table.insert(sections.lualine_c, module)
			end

			for _, module in pairs(right_modules) do
				table.insert(sections.lualine_x, module)
			end

			return sections
		end)(),
		inactive_sections = {
			lualine_c = {},
			lualine_x = {},
		},
	},
}
