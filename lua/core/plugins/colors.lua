return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					harpoon = true,
					mason = true,
					noice = true,
					notify = true,
				},
				custom_highlights = function(colors)
					return {
						TelescopePromptBorder = { fg = colors.peach },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.gruvbox_material_enable_italic = 1
		-- 	vim.g.gruvbox_material_float_style = "dim"
		-- 	vim.cmd.colorscheme("gruvbox-material")
		-- end,
	},
	{
		"sainnhe/everforest",
		name = "everforest",
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.everforest_enable_italic = true
		-- 	vim.cmd.colorscheme("everforest")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		-- priority = 1000,
		-- opts = {},
		-- config = function()
		-- 	vim.cmd.colorscheme("tokyonight-night")
		-- end,
	},
}
