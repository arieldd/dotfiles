return { -- Status line below
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local noice = require("noice")
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "catppuccin",
				-- theme = "gruvbox-material",
				-- theme = "everforest",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = {
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
					"encoding",
					"fileformat",
					"filetype",
				},
			},
			extensions = {
				"neo-tree",
				"lazy",
				"mason",
				"trouble",
			},
		})
	end,
}
