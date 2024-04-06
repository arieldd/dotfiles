return {
	select = {
		enable = true,
		lookahead = true,

		keymaps = {
			["a="] = { query = "@assignment.outer", desc = "Select [a]round assignment" },
			["i="] = { query = "@assignment.inner", desc = "Select [i]nside assignment" },
			["l="] = { query = "@assignment.lhs", desc = "Select assignment [l]hs" },
			["r="] = { query = "@assignment.rhs", desc = "Select assignment [r]hs" },

			["aa"] = { query = "@parameter.outer", desc = "Select [a]round [a]rgument" },
			["ia"] = { query = "@parameter.inner", desc = "Select [i]nside [a]rgument" },

			["af"] = { query = "@function.outer", desc = "Select [a]round [f]unction" },
			["if"] = { query = "@function.inner", desc = "Select [i]nside [f]unction" },

			["ac"] = "@class.outer",
			["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
		},
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]f"] = { query = "@function.outer", desc = "Next [f]unction start" },
			["]k"] = { query = "@block.outer", desc = "Next bloc[k] start" },
			["]a"] = { query = "@parameter.inner", desc = "Next [a]rgument start" },

			["]o"] = { query = "@loop.*", desc = "Next lo[o]p" },
			["]s"] = { query = "@scope", query_group = "locals", desc = "Next [s]cope" },
			["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
		},
		goto_next_end = {
			["]F"] = { query = "@function.outer", desc = "Next [f]unction end" },
			["]K"] = { query = "@block.outer", desc = "Next bloc[k] end" },
			["]A"] = { query = "@parameter.inner", desc = "Next [a]rgument end" },
		},
		goto_previous_start = {
			["[f"] = { query = "@function.outer", desc = "Previous [f]unction start" },
			["[k"] = { query = "@block.outer", desc = "Previous bloc[k] start" },
			["[a"] = { query = "@parameter.inner", desc = "Previous [a]rgument start" },
		},
		goto_previous_end = {
			["[F"] = { query = "@function.outer", desc = "Previous [f]unction end" },
			["[K"] = { query = "@block.outer", desc = "Previous bloc[k] end" },
			["[A"] = { query = "@parameter.inner", desc = "Previous [a]rgument end" },
		},
	},
	swap = {
		enable = true,
		swap_next = {
			["<leader>as"] = "@parameter.inner",
		},
		swap_previous = {
			["<leader>aS"] = "@parameter.inner",
		},
	},
	lsp_interop = {
		enable = true,
		border = "none",
		floating_preview_opts = {},
		peek_definition_code = {
			["<leader>df"] = { query = "@function.outer", desc = "Peek [d]efinition of [f]unction" },
			["<leader>dc"] = { query = "@class.outer", desc = "Peek [d]efinition of [c]lass" },
		},
	},
}
