return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			local parsers = require("core.plugins.treesitter.parsers")
			local textobjects = require("core.plugins.treesitter.textobjects")

			configs.setup({
				auto_install = true,
				ensure_installed = parsers,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-s>",
						node_incremental = "<C-s>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				textobjects = textobjects,
			})

			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
		end,
	},
}
