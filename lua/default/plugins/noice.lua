return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	enabled = true,
	config = function()
		require("noice").setup({})
		require("notify").setup({
			render = "wrapped-compact",
			stages = "fade",
			timeout = 3000,
		})
	end,
}
