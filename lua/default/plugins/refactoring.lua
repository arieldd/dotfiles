return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("refactoring").setup()
		-- load refactoring Telescope extension
		require("telescope").load_extension("refactoring")

		vim.keymap.set({ "n", "x" }, "<leader>rf", function()
			require("telescope").extensions.refactoring.refactors()
		end)
	end,
}
