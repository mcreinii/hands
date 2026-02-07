return {
	-- Autopairs
	-- For auto pairing of quotes, brackets and etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	-- Autotag
	-- For auto tag completion and rename using TS
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			per_filetype = {
				["html"] = {
					enable_close = false,
				},
			},
			aliases = {
				["javascriptreact"] = "html",
				["typescriptreact"] = "html",
			},
		},
	},

	-- Formatter
	-- Auto formatting and fallback
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},

	-- Surround
	-- For surrounding texts with keybinds
	{ "nvim-mini/mini.surround", version = "*", opts = {} },

	-- Hipatterns
	-- Colorcodes preview
	{
		"nvim-mini/mini.hipatterns",
		version = "*",
		opts = {},
		config = function(_, opts)
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({

				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},

	-- Whichkey
	-- Show which keybinds are availabe
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {},
		config = function(_, opts)
			local which_key = require("which-key")
			which_key.setup(opts)

			which_key.add({
				-- Whichkey Groups
				{ "<leader>f", group = "Find", icon = "" },
				{ "<leader>l", group = "Language", icon = "󰢱" },
				{ "<leader>g", group = "Git", icon = "" },
				{ "<leader>P", group = "Packages", icon = "" },
				{ "<leader>d", group = "Diagnostics", icon = "" },
				{ "<leader>Pl", group = "Lazy", icon = "󰒲" },
				{ "<leader>Pm", group = "Mason", icon = "󰌛" },
				{ "<leader>m", group = "Markdown", icon = "󰽛" },
				{ "<leader>t", group = "Terminal", icon = "" },

				-- Keymaps
				{ "<leader>Q", icon = "" },
				{ "<leader>q", icon = "" },
				{ "<leader>w", icon = "" },
			})
		end,
	},
}
