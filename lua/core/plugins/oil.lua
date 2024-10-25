return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				"permissions",
				"size",
			},
			keymaps = {
				["<C-h>"] = false,
			},
		})

		vim.keymap.set("n", "-", ":Oil<CR>", { silent = true, desc = "Open parent directory" })
	end,
}
