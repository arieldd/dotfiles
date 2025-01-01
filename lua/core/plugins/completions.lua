return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
				config = function()
					require("luasnip").config.setup({})
					require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/core/plugins/snippets" } })
				end,
			},
		},
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
				["<C-l>"] = { "snippet_forward", "fallback" },
			},
			completion = {
				menu = {
					draw = {
						columns = { { "kind_icon", "label", gap = 1 }, { "label_description", "kind", gap = 1 } },
					},
				},
			},
			sources = {
				default = { "lsp", "path", "buffer", "luasnip" },
			},
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
		},
	},
}
