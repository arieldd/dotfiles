return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					blink_cmp = true,
					harpoon = true,
					mason = true,
					noice = true,
					notify = true,
					snacks = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
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
		-- 	vim.cmd.colorscheme("tokyonight-storm")
		-- end,
	},
}
