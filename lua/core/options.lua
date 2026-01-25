local M = {}

M.opt = vim.o

M.defaults = {
	number = true,
	relativenumber = true, -- Show relative line numbers for easier movement
	undofile = true, -- Persist undo history across sessions
	splitbelow = true, -- New splits open below the current one
	splitright = true, -- New splits open to the right
	expandtab = true, -- Convert tabs to spaces
	smarttab = true, -- Spaces instead of tabs when using tab
	tabstop = 4, -- Tab width (spaces)
	shiftwidth = 4, -- Indent width (spaces)
	wrap = false, -- Disable line wrapping
	hlsearch = true, -- Highlight search matches
	smartcase = true, -- Enable case-sensitive searching if uppercase letters are used
	ignorecase = true, -- Ignore case in searches by default
	encoding = "utf8", -- Set file encoding to UTF-8
	backup = false, -- Disable backup files
	clipboard = "unnamedplus", -- Use system clipboard for copy-paste
	showmode = false, -- Disable --INSERT-- mode line
	laststatus = 3, -- Global statusline (modern Neovim)
	pumheight = 10, -- Limit popup menu height
	cmdheight = 0, -- Use minimal command line height (nvim 0.9+)
	termguicolors = true, -- Enable true color support
	winborder = "rounded", -- (rounded, double, single, solid, shadow or none)
}

function M.disable_netrw()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

function M.relative_num()
	vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
		callback = function()
			if vim.bo.buftype == "" then
				vim.opt_local.number = true
				vim.opt_local.relativenumber = true
			end
		end,
	})
end

function M.explicit_rn()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "neo-tree",
		callback = function()
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
		end,
	})
end

function M.setup(options)
	options = vim.tbl_extend("force", M.defaults, options or {})

	for option, value in pairs(options) do
		M.opt[option] = value
	end
end

return M
