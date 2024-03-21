return {
	"folke/noice.nvim",
	dependencies = {
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	enabled = true,
	config = function()
		require("default.plugins.ui-configs.dressing")
		require("default.plugins.ui-configs.noice")
		require("default.plugins.ui-configs.notify")
	end,
}
