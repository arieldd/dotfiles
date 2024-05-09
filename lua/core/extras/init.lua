-- Register a toy lsp client for demo purposes
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
