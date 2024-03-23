return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				telescope = true,
				mason = true,
				neotest = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		-- opts = {
		-- 	integrations = {
		-- 		telescope = true,
		-- 		mason = true,
		-- 		neotest = true,
		-- 	},
		-- },
		-- config = function(_, opts)
		-- 	require("gruvbox").setup(opts)
		-- 	vim.cmd.colorscheme("gruvbox")
		-- end,
	},
}
