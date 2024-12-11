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
		keys = {
			{
				"<leader>gl",
				function()
					Snacks.lazygit()
				end,
				desc = "Open LazyGit or [g]it [l]azy",
			},
			{
				"<leader>gb",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Open remote repo or [g]it [b]rowse",
			},
		},
	},
}
