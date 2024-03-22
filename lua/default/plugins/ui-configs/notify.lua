vim.notify = require("notify")

require("notify").setup({
	background_colour = "Normal",
	icons = {
		DEBUG = " ",
		ERROR = " ",
		INFO = " ",
		TRACE = "✎",
		WARN = " ",
	},
	level = 2,
	minimum_width = 50,
	maximum_width = 50,
	render = "default",
	stages = "fade",
	timeout = 5000,
})
