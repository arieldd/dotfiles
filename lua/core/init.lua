require("core.remaps")
require("core.opts")
require("core.autocommands")
require("core.lazy")
require("lazy").setup({
	spec = {
		{ import = "core.plugins" },
	},
	checker = { enabled = true },
})

-- Any extra or temp config changes that we'd want to load.
require("core.extras")
