return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
			},
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["<C-h>"] = false,
				["<C-p>"] = false,
				["<C-l>"] = "actions.preview",
				["<C-r>"] = "actions.refresh",
			},
			constrain_cursor = "name",
		})

		vim.keymap.set("n", "-", ":Oil<CR>", { silent = true, desc = "Open parent directory" })
	end,
}
