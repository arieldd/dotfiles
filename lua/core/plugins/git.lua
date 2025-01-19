return {
	"tpope/vim-fugitive",
	enabled = true,
	config = function()
		vim.keymap.set("n", "<leader>gG", "<cmd>G<CR>", { desc = "Bring out the [G], vim fugitive", silent = true })
	end,
}
