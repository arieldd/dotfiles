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
					python = { "isort", "black" },
					html = { "prettierd", "prettier" },
					javascript = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					cpp = { "clang-format" },
					go = { "goimports", "gofmt" },
					cmake = { "cmake_format" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			vim.keymap.set("n", "<leader>ff", require("conform").format, { desc = "Formatter: [f]ormat file." })
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
				html = { "htmlhint" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				css = { "eslint_d" },
				json = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			vim.keymap.set("n", "<leader>fl", require("lint").try_lint, { desc = "Formatter: Try [l]int." })
		end,
	},
}
