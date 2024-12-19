local M = {
	"bash",
	"c",
	"cpp",
	"go",
	"html",
	"javascript",
	"lua",
	"latex",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"templ",
	"rust",
	"vim",
	"vimdoc",
}

-- Register '.templ' file extension
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

return M
