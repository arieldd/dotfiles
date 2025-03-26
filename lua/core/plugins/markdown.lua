return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup()
		vim.keymap.set("n", "<leader>md", require("peek").open, { desc = "Open [M]ark[d]own preview" })
		vim.keymap.set("n", "<leader>mD", require("peek").close, { desc = "Close [M]ark[d]own preview" })
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
}
