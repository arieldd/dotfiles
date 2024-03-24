vim.notify = require("notify")

require("notify").setup({
	background_colour = "Normal",
	fps = 60,
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
	render = "compact",
	stages = "static",
	timeout = 3000,
})
