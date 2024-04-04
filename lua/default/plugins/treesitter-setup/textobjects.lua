return {
	select = {
		enable = true,
		lookahead = true,

		keymaps = {
			["af"] = "@function.outer",
			["if"] = "@function.inner",
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
			["]f"] = { query = "@function.outer", desc = "Nwxt function start" },
			["]]"] = { query = "@class.outer", desc = "Next class start" },
			["]b"] = { query = "@block.outer", desc = "Next block start" },
			--
			-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
			["]o"] = { query = "@loop.*", desc = "Next loop" },
			-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
			--
			["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
			["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
		},
		goto_next_end = {
			["]F"] = { query = "@function.outer", desc = "Next function end" },
			["]["] = { query = "@class.outer", desc = "Next class end" },
			["]B"] = { query = "@block.outer", desc = "Next block end" },
		},
		goto_previous_start = {
			["[f"] = { query = "@function.outer", desc = "Previous function start" },
			["[["] = { query = "@class.outer", desc = "Previous class end" },
			["[b"] = { query = "@block.outer", desc = "Previous block start" },
		},
		goto_previous_end = {
			["[F"] = { query = "@function.outer", desc = "Previous function end" },
			["[]"] = { query = "@class.outer", desc = "Previous class end" },
			["[B"] = { query = "@block.outer", desc = "Previous block end" },
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
