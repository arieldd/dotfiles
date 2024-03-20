return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				auto_install = true,
				ensure_installed = {
					"c",
					"lua",
					"rust",
					"javascript",
					"html",
					"cpp",
					"go",
					"python",
					"regex",
					"bash",
					"query",
					"vimdoc",
					"markdown",
					"markdown_inline",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}
