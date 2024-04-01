return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<leader>tm]],
		})

		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
		vim.keymap.set("t", "jk", [[<C-\><C-n>]])
	end,
}
