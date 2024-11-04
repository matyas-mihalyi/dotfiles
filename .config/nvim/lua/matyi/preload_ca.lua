local function preload_suggestions_on_error()
	local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	if #diagnostics > 0 and diagnostics[1].range then
		-- Fetch code actions silently
		vim.lsp.buf_request(0, "textDocument/codeAction", {
			textDocument = vim.lsp.util.make_text_document_params(),
			range = {
				start = diagnostics[1].range.start,
				["end"] = diagnostics[1].range["end"],
			},
		})
	end
end

-- Autocommand to trigger the preload function
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = preload_suggestions_on_error,
	group = vim.api.nvim_create_augroup("LspPreloadSuggestionsOnError", { clear = true }),
})
