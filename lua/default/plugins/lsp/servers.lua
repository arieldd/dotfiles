local servers = {
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp" },
	},
	gopls = {},
	pyright = {},
	-- Set up in dedicated plugin
	rust_analyzer = {},
	tsserver = {},
	tailwindcss = {},
	lua_ls = {},
	htmx = {},
	html = {},
}

return servers
