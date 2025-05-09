vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("CoreLspConfig", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					callback = vim.lsp.buf.clear_references,
				})
			end
			if client.server_capabilities.inlayHintProvider then
				map("<leader>hh", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ event.buf }), { event.buf })
				end, "Toggle inlay [h]ints")
			end
		end
	end,
})
