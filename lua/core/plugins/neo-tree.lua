return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			popup_border_style = "rounded",
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.opt.relativenumber = true
					end,
				},
			},
		})

		vim.keymap.set("n", "-", ":Neotree filesystem toggle reveal float<CR>", { silent = true })
		vim.keymap.set(
			"n",
			"<leader>-",
			":Neotree filesystem toggle float<CR>",
			{ silent = true, desc = "Reveal filesystem tree" }
		)
	end,
}
