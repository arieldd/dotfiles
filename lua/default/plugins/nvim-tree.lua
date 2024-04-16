return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				relativenumber = true,
			},
		})

		vim.keymap.set("n", "<leader>se", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [S]how [e]xplorer." })
		vim.keymap.set(
			"n",
			"<leader>sf",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle [S]how explorer on current [f]ile." }
		)
	end,
}
