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
	lua_ls = {},
	pyright = {},
	rust_analyzer = {},
	ts_ls = {
		workspace_required = true,
	},
	templ = {
		filetypes = { "templ" },
	},
	zls = {},
}

return M
