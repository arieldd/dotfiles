local color_themes = {
	["catppuccin"] = { "catppuccin/nvim" },
	["rose-pine"] = { "rose-pine/neovim" },
	["gruvbox"] = { "ellisonleao/gruvbox.nvim" },
	["gruvbox-material"] = { "f4z3r/gruvbox-material.nvim" },
}

local function setTheme(theme_name)
	local theme = color_themes[theme_name]

	theme.name = theme_name
	theme.priority = 1000
	theme.opts = {
		integrations = {
			telescope = true,
			mason = true,
			neotest = true,
		},
	}
	theme.config = function(_, opts)
		require(theme_name).setup(opts)
		vim.cmd.colorscheme(theme_name)
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	end
end

setTheme("gruvbox-material")

local plugins = {}

for _, v in pairs(color_themes) do
	table.insert(plugins, v)
end

return plugins
