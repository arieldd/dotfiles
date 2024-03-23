return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("mason").setup()

			require("default.plugins.lsp-setup.mappings")
			local servers = require("default.plugins.lsp-setup.servers")
			local linters = require("default.plugins.lsp-setup.linters")

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, linters)

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities(), {
				offsetEncoding = { "utf-16" },
				general = {
					positionsEncodings = { "utf-16" },
				},
			})

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
