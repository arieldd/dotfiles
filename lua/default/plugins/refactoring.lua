return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({})

		vim.keymap.set(
			{ "v", "x" },
			"<leader>rf",
			":lua require('refactoring').select_refactor()<cr>",
			{ silent = true, desc = "[R]e[f]actor selected code" }
		)
	end,
}
