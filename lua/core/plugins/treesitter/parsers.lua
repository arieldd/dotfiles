local M = {
	"bash",
	"c",
	"cpp",
	"go",
	"html",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"templ",
	"rust",
	"vimdoc",
}

-- Register '.templ' file extension
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

return M
