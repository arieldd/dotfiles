return {
	"folke/trouble.nvim",
	branch = "dev", -- IMPORTANT!
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xd",
			"<cmd>Trouble lsp toggle win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	opts = {}, -- for default options, refer to the configuration section for custom setup.
}
