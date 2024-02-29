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

-- goto definition in new right side pane
vim.keymap.set('n', 'gds', ':bo vs | lua vim.lsp.buf.definition()<CR>')

-- exit inser mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- center view
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

