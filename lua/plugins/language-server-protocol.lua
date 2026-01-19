return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		automatic_enable = true,
		ensure_installed = {
			"lua_ls",
			"stylua",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
			keys = {
				{ "<leader>Pm", ":Mason<CR>", desc = "Open Mason", silent = true, noremap = true },
			},
		},
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)

		-- Enable keybinds on LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				local opts = { noremap = true, silent = true }

				-- LSP Keymaps Grouped Under <leader>l using Inline Functions
				-- Add descriptions for which-key or similar keybinding helper

				-- Go to definition
				vim.keymap.set("n", "<leader>ld", function()
					vim.lsp.buf.definition()
				end, { desc = "Go to definition", noremap = true, silent = true })

				-- Source action
				vim.keymap.set("n", "<leader>la", function()
					vim.lsp.buf.code_action()
				end, { desc = "Go to definition", noremap = true, silent = true })

				-- Show hover documentation
				vim.keymap.set("n", "<leader>lh", function()
					vim.lsp.buf.hover()
				end, { desc = "Show hover documentation", noremap = true, silent = true })

				-- Go to declaration
				vim.keymap.set("n", "<leader>lD", function()
					vim.lsp.buf.declaration()
				end, { desc = "Go to declaration", noremap = true, silent = true })

				-- Find references
				vim.keymap.set("n", "<leader>lr", function()
					vim.lsp.buf.references()
				end, { desc = "Find references", noremap = true, silent = true })

				-- Go to implementation
				vim.keymap.set("n", "<leader>li", function()
					vim.lsp.buf.implementation()
				end, { desc = "Go to implementation", noremap = true, silent = true })

				-- Go to type definition
				vim.keymap.set("n", "<leader>lo", function()
					vim.lsp.buf.type_definition()
				end, { desc = "Go to type definition", noremap = true, silent = true })

				-- Rename symbol
				vim.keymap.set("n", "<leader>lR", function()
					vim.lsp.buf.rename()
				end, { desc = "Rename symbol", noremap = true, silent = true })

				-- Show code actions
				vim.keymap.set("n", "<leader>lca", function()
					vim.lsp.buf.code_action()
				end, { desc = "Show code actions", noremap = true, silent = true })

				-- Format buffer
				vim.keymap.set("n", "<leader>lf", function()
					vim.lsp.buf.format()
				end, { desc = "Format buffer", noremap = true, silent = true })

				-- Show diagnostics in a floating window
				vim.keymap.set("n", "<leader>le", function()
					vim.diagnostic.open_float()
				end, { desc = "Show diagnostics (Floating)", noremap = true, silent = true })

				-- Go to previous diagnostic
				vim.keymap.set("n", "<leader>l[", function()
					vim.diagnostic.goto_prev()
				end, { desc = "Go to previous diagnostic", noremap = true, silent = true })

				-- Go to next diagnostic
				vim.keymap.set("n", "<leader>l]", function()
					vim.diagnostic.goto_next()
				end, { desc = "Go to next diagnostic", noremap = true, silent = true })

				-- Show diagnostics in location list
				vim.keymap.set("n", "<leader>lq", function()
					vim.diagnostic.setloclist()
				end, { desc = "Show diagnostics (Location list)", noremap = true, silent = true })
			end,
		})
	end,
}
