local M = {
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp" },
	},
	cmake = {},
	gopls = {},
	html = {
		filetypes = { "html", "templ" },
		capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						snippetSupport = true,
					},
				},
			},
		},
	},
	htmx = {
		filetypes = { "html", "templ" },
	},
	kotlin_language_server = {},
	lua_ls = {},
	pyright = {},
	rust_analyzer = {},
	ts_ls = {},
	tailwindcss = {},
	templ = {
		filetypes = { "templ" },
	},
	zls = {},
}

return M
