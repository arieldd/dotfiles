return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()

			local servers = require("core.plugins.lsp.servers")
			local linters = require("core.plugins.lsp.linters")

			for server, config in pairs(servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

			for _, linter in ipairs(linters) do
				vim.lsp.config(linter, {})
				vim.lsp.enable(linter)
			end

			-- Inlay hints --
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("CoreLspConfig", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client then
						print("attaching client " .. client["name"])
						if client.server_capabilities.inlayHintProvider then
							map("<leader>hh", function()
								vim.lsp.inlay_hint.enable(
									not vim.lsp.inlay_hint.is_enabled({ event.buf }),
									{ event.buf }
								)
							end, "Toggle inlay [h]ints")
						end
					end
				end,
			})
		end,
	},
}
