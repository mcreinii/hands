return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = "markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	keys = {
		{ "<leader>mt", ":RenderMarkdown buf_toggle<CR>", desc = "Toggle (Buf)", silent = true, noremap = true },
		{ "<leader>me", ":RenderMarkdown enable<CR>", desc = "Enable", silent = true, noremap = true },
		{ "<leader>md", ":RenderMarkdown disable<CR>", desc = "disable", silent = true, noremap = true },
	},
}
