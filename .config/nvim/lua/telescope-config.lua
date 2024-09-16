require('telescope').setup{}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>FF', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>st', builtin.git_status, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>ff', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
