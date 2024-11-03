-- Function to wrap the selected text with a given character
local function wrap_selected_text(char)
	-- Ensure a single character was provided
	if #char ~= 1 then
		print("Please provide a single character.")
		return
	end

	-- Get the visual selection range
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the selected text
	local lines = vim.fn.getline(start_pos[2], end_pos[2])
	local start_col = start_pos[3]
	local end_col = end_pos[3]

	-- Wrap the text
	if #lines == 1 then
		-- Single line selection
		local line = lines[1]
		local wrapped = char .. line:sub(start_col, end_col) .. char
		vim.fn.setline(start_pos[2], line:sub(1, start_col - 1) .. wrapped .. line:sub(end_col + 1))
	else
		-- Multiline selection handling (optional; here only wraps the first and last line)
		print("Multiline selections are currently not supported.")
	end
end

-- Create a user command that accepts a single character argument
vim.api.nvim_create_user_command("WrapWith", function(opts)
	wrap_selected_text(opts.args)
end, { nargs = 1 })

-- Map the command to a key combination in visual mode
vim.keymap.set("v", "<leader>w", ":<C-u>WrapWith ", { desc = "Wrap selected text with character", silent = false })
