-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.pvp" },
	group = vim.api.nvim_create_augroup("pvp-toy-lsp", { clear = true }),
	callback = function()
		vim.lsp.start({
			name = "toylsp",
			cmd = { "go", "run", "main.go" },
			root_dir = ".",
		})
	end,
})
