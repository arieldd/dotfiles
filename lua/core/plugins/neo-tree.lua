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
			filesystem = {
				hijack_netrw_behavior = "disabled",
			},
		})

		vim.keymap.set(
			"n",
			"<leader>-",
			":Neotree filesystem toggle reveal left<CR>",
			{ silent = true, desc = "Reveal parent directory with NeoTree on a floating window." }
		)
	end,
}
