return {
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { { "prettierd", "prettier" } },
					html = { { "prettierd", "prettier" } },
					cpp = { "clang-format" },
					go = { "goimports", "gofmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "[Formatters] Fomat file." })
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local linters = require("lint")

			linters.linters_by_ft = {
				javascript = { "eslint_d" },
				html = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}
		end,
	},
}
