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
					javascript = { "prettierd" },
					json = { "prettierd" },
					html = { "prettierd" },
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

			vim.keymap.set("n", "<leader>fm", require("conform").format, { desc = "[Formatters] For[m]at file." })
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
				html = { "htmlhint" },
				typescript = { "eslint_d" },
				json = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					linters.try_lint()
				end,
			})
		end,
	},
}
