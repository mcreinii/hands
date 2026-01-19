local M = {}

M.default_theme = "vague"

function M.setup(theme)
	local is_available, error = pcall(vim.cmd, "colorscheme " .. (theme or M.default_theme))

	if not is_available then
		vim.notify("Colorscheme " .. (theme or M.default_theme) .. " not found", vim.log.levels.WARN)
		-- Apply default theme as a fallback
		vim.cmd("colorscheme " .. M.default_theme)
	end
end

return M
