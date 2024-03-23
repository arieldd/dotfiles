return {
	"folke/noice.nvim",
	dependencies = {
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	enabled = true,
	config = function()
		require("default.plugins.noice-setup.dressing")
		require("default.plugins.noice-setup.noice")
		require("default.plugins.noice-setup.notify")
	end,
}
