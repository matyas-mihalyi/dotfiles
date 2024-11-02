local theme_file = vim.fn.stdpath("config") .. "/theme.txt"
local file = io.open(theme_file, "r")
if file then
	local content = file:read("*a")
	vim.o.background = content
	file:close()
else
	print("Error saving theme to file")
end
