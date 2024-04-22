return { -- Status line below
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local noice = require("noice")

		local symbols = require("trouble").statusline({
			mode = "lsp_document_symbols",
			groups = {},
			-- max_items = 3,
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name}",
		})

		local lualine = require("lualine")
		lualine.setup({
			-- options = { theme = "gruvbox-material" },
			options = { theme = "catppuccin" },
			sections = {
				lualine_x = {
					{
						noice.api.status.message.get_hl,
						cond = noice.api.status.message.has,
					},
					{
						noice.api.status.command.get,
						cond = noice.api.status.command.has,
						color = { fg = "#ff9e64" },
					},
					{
						noice.api.status.mode.get,
						cond = noice.api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						noice.api.status.search.get,
						cond = noice.api.status.search.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_c = {
					{
						symbols.get,
						cond = symbols.has,
					},
				},
			},
			extensions = {
				"nvim-tree",
				"lazy",
				"mason",
				"trouble",
			},
		})
	end,
}
