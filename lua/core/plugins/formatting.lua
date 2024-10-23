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
					typescript = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					cpp = { "clang-format" },
					go = { "goimports", "gofmt" },
					cmake = { "cmake_format" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_format = "fallback" }
				end,
			})

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
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
