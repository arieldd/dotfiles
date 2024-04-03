local color_themes = {
	["catppuccin"] = { "catppuccin/nvim", name = "catppuccin" },
	["rose-pine"] = { "rose-pine/neovim", name = "rose-pine" },
	["gruvbox"] = { "ellisonleao/gruvbox.nvim", name = "gruvbox" },
	["gruvbox-material"] = { "f4z3r/gruvbox-material.nvim", name = "gruvbox-material" },
}

local function setTheme(theme_name)
	local theme = color_themes[theme_name]

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
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	end
end

setTheme("gruvbox-material")

local plugins = {}

for _, v in pairs(color_themes) do
	table.insert(plugins, v)
end

return plugins
