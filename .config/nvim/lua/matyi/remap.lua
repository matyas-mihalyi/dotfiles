vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- panes
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>L", "<C-w>L")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>H", "<C-w>H")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>J", "<C-w>J")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>K", "<C-w>K")

vim.keymap.set("n", "<C-i>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- terminal
vim.keymap.set("t", "<esc>", [[<c-\><c-n>]])

-- goto definition in new right side pane
vim.keymap.set("n", "gds", ":bo vs | lua vim.lsp.buf.definition()<CR>")

-- exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- center view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- toggle theme
local theme_file = vim.fn.stdpath("config") .. "/theme.txt"
local function save_theme(theme)
	local file = io.open(theme_file, "w")
	if file then
		file:write(theme)
		file:close()
	else
		print("Error saving theme to file")
	end
end

vim.keymap.set("n", "<leader>tt", function()
	if vim.o.background == "light" then
		vim.o.background = "dark"
		save_theme("dark")
	else
		vim.o.background = "light"
		save_theme("light")
	end
end)
