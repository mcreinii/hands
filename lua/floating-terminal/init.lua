local M = {}

M.terminal_statuses = {
	floating = {
		buf = nil,
		win = nil,
		open = false,
	},
}

function M.HideTerminal(mode)
	vim.api.nvim_win_close(M.terminal_statuses[mode].win, false)
	M.terminal_statuses[mode].open = false
end

function M.ToggleFloating(opts, mode)
	if M.terminal_statuses.floating.open and vim.api.nvim_win_is_valid(M.terminal_statuses.floating.win) then
		M.HideTerminal(mode)
		return
	end

	if not M.terminal_statuses.floating.buf or not vim.api.nvim_buf_is_valid(M.terminal_statuses.floating.buf) then
		M.terminal_statuses.floating.buf = vim.api.nvim_create_buf(false, true)
	end

	local width = math.floor(vim.o.columns * (opts.width or 0.8))
	local heigth = math.floor(vim.o.lines * (opts.height or 0.8))

	local x = math.floor((vim.o.columns - width) / 2)
	local y = math.floor((vim.o.lines - heigth) / 2)

	M.terminal_statuses.floating.win = vim.api.nvim_open_win(M.terminal_statuses.floating.buf, true, {
		relative = "editor",
		width = width,
		height = heigth,
		col = x,
		row = y,
		style = "minimal",
		border = vim.o.winborder or "double",
	})

	local terminal_running = false
	local window_lines = vim.api.nvim_buf_get_lines(M.terminal_statuses.floating.buf, 0, -1, false)
	for _, line in pairs(window_lines) do
		if line ~= "" then
			terminal_running = true
			break
		end
	end

	if not terminal_running then
		vim.cmd([[terminal]])
	end

	M.terminal_statuses.floating.open = true
end

function M.setup(opts)
	vim.api.nvim_create_user_command("HandsTerminal", function(args)
		local mode = table.concat(args.fargs)
		if "floating" == mode then
			M.ToggleFloating(opts, mode)
		end
	end, { nargs = 1 })
end
return M
