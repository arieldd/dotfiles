return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local telescope = require("telescope")
			local open_with_trouble = require("trouble.sources.telescope").open
			telescope.setup({
				defaults = {
					prompt_prefix = "   ",
					entry_prefix = "   ",
					multi_icon = "  ",
					selection_caret = "  ",
					results_title = "",
					prompt_title = " Prompt ",
					mappings = {
						i = { ["<c-t>"] = open_with_trouble },
						n = { ["<c-t>"] = open_with_trouble },
					},
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					path_display = { "smart" },
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			pcall(telescope.load_extension("fzf"))
			pcall(telescope.load_extension("ui-select"))
			pcall(telescope.load_extension("notify"))
			pcall(telescope.load_extension("noice"))
			pcall(telescope.load_extension("live_grep_args"))

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})

			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[Find] [H]elp" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[Find] [K]eymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[Find] [F]iles" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[Find] [S]elect Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[Find] current [W]ord" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				{ desc = "[Find] by [G]rep", silent = true }
			)
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[Find] [D]iagnostics" })
			vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "[Find] [T]hemes" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[Find] [R]esume" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[Find] Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>f/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[Find] [/] in Open Files" })

			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[Find] [N]eovim files" })
		end,
	},
}
