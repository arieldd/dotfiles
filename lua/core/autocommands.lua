-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- TODO: does not work currently with iterm2 abd forwarding.
-- if vim.fn.has("macunix") then
-- 	vim.api.nvim_create_autocmd("BufEnter", {
-- 		pattern = { "*.png", "*.jpg", "*.gif" },
-- 		desc = "Visualize images inside neovim using iterm2 'imgcat' command",
-- 		group = vim.api.nvim_create_augroup("iterm2-cmds", { clear = true }),
-- 		callback = function()
-- 			vim.cmd("bw")
-- 			vim.cmd(":read !~/.iterm2/imgcat " .. vim.fn.expand("%"))
-- 		end,
-- 	})
-- end
