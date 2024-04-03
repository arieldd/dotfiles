return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	enabled = true,
	config = function()
		require("default.plugins.noice-setup.noice")
		require("default.plugins.noice-setup.notify")
	end,
}
