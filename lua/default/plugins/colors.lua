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
					lsp_trouble = true,
					neotree = true,
					noice = true,
					notify = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"f4z3r/gruvbox-material.nvim",
		name = "gruvbox-material",
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.gruvbox_material_transparent_background = 1
		-- 	require("gruvbox-material").setup()
		-- end,
	},
}
