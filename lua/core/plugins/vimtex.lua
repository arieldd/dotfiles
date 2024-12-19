return {
	"lervag/vimtex",
	init = function()
		vim.g.vimtex_view_method = "zathura"

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			desc = "Adds key mappings for TeX files",
			pattern = "*.tex",
			callback = function()
				vim.keymap.set(
					"n",
					"<F5>",
					"<cmd>VimtexCompileSS<CR>",
					{ desc = "Compiles current latex file", silent = true }
				)
			end,
		})
	end,
}
