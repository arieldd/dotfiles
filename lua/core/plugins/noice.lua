return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	enabled = true,
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			markdown = {
				hover = {
					["|(%S-)|"] = vim.cmd.help, -- vim help links
					["%[.-%]%(file://([^%)]+)%)"] = vim.cmd.split, -- markdown links to local files
					-- ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
				},
			},
			presets = {
				bottom_search = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		})

		vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
			if not require("noice.lsp").scroll(4) then
				return "<c-f>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-b>"
			end
		end, { silent = true, expr = true })
	end,
}
