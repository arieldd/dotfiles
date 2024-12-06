return {
	{
		"tpope/vim-fugitive",
		enabled = true,
	},
	{
		"folke/snacks.nvim",
		opts = {
			lazygit = {},
		},
		config = function()
			vim.keymap.set(
				"n",
				"<leader>lg",
				":lua Snacks.lazygit.open()<CR>",
				{ desc = "Open LazyGit from Snacks", silent = true }
			)
		end,
	},
}
