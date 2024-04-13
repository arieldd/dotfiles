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
			git = {
				ignore = false,
			},
		})

		vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [F]ile [e]xplorer." })
		vim.keymap.set(
			"n",
			"<leader>ff",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle [F]ile explorer on current [f]ile." }
		)
	end,
}
