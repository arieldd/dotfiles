return {
	{
		"tpope/vim-fugitive",
		enabled = true,
		config = function()
			vim.keymap.set("n", "<leader>gG", "<cmd>G<CR>", { desc = "Bring out the [G], vim fugitive", silent = true })
		end,
	},
	{
		"folke/snacks.nvim",
		opts = {
			lazygit = {},
			gitbrowse = {},
		},
		config = function()
			vim.keymap.set(
				"n",
				"<leader>gl",
				":lua Snacks.lazygit.open()<CR>",
				{ desc = "Open LazyGit or [g]it [l]azy", silent = true }
			)

			vim.keymap.set(
				"n",
				"<leader>gb",
				":lua Snacks.gitbrowse.open()<CR>",
				{ desc = "Open remote repo or [g]it [b]rowse", silent = true }
			)
		end,
	},
}
