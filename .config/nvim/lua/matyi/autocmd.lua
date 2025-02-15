-- save on leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		local bufname = vim.fn.expand("%")
		local filetype = vim.bo.filetype

		-- Ensure the buffer has a real file name and exclude certain filetypes
		if
			bufname ~= ""
			and bufname ~= nil
			and filetype ~= "netrw"
			and filetype ~= "oil"
			and filetype ~= "TelescopePrompt"
		then
			vim.cmd("silent! write")
		end
	end,
})

-- terminal look
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
