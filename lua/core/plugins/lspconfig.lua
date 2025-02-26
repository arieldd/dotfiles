return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "folke/lazydev.nvim", ft = "lua" },
			"saghen/blink.cmp",
		},
		config = function()
			require("core.plugins.lsp.setup")
			local servers = require("core.plugins.lsp.servers")
			local linters = require("core.plugins.lsp.linters")

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, linters)

			require("mason").setup()
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
