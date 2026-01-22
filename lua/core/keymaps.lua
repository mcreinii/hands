local M = {}

M.defaults = {
	n = {
		-- Neovim
		{ "<leader>Q", ":qa<CR>", desc = "Close Neovim", silent = true, noremap = true },
		{ "<leader>q", ":q<CR>", desc = "Close current", silent = true, noremap = true },

		-- Buffers
		{ "<leader>w", ":w<cr>", desc = "Write buffer", silent = true, noremap = true },

		-- Inteface
		{ "<C-h>", ":noh<CR>", desc = "Clear highlights", silent = true, noremap = true },

		-- Lazy
		{ "<leader>Pll", ":Lazy<CR>", desc = "Lazy", silent = true, noremap = true },
		{ "<leader>Pls", ":Lazy sync<CR>", desc = "Lazy (Sync)", silent = true, noremap = true },
		{ "<leader>Pli", ":Lazy install<CR>", desc = "Lazy (Install)", silent = true, noremap = true },
		{ "<leader>Plu", ":Lazy update<CR>", desc = "Lazy (Update)", silent = true, noremap = true },
		{ "<leader>Plc", ":Lazy clean<CR>", desc = "Lazy (Clean)", silent = true, noremap = true },

		-- Scrolling
		{ "<C-d>", "<C-d>zz", desc = "Scroll down (Centered)" },
		{ "<C-u>", "<C-u>zz", desc = "Scroll up (Centered)" },
	},
	v = {},
	t = {},
}

function M.keymap(keymaps)
	for mode, keymap in pairs(keymaps) do
		for _, values in pairs(keymap) do
			-- Take the mapping and action
			local map = values[1]
			local action = values[2]

			-- Remove the map and action for Looping the opts
			table.remove(values, 1)
			table.remove(values, 1)

			-- Define the opts and add values.
			local opts = {}
			for option, value in pairs(values) do
				opts[option] = value
			end

			-- Set the keymap
			vim.keymap.set(mode, map, action, opts)
		end
	end
end

function M.setup(keymaps)
	keymaps = vim.tbl_extend("force", M.defaults, keymaps or {})

	-- Loop each mode and it's values (mapping, actions and opts)
	M.keymap(keymaps)
end

return M
