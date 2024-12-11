local telescope = require("telescope")

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>FF", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>st", builtin.git_status, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>ff", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set(
	"n",
	"<leader>fg",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ desc = "Live Grep Args" }
)
vim.keymap.set(
	"n",
	"<leader>fc",
	':lua require("telescope.builtin").live_grep({ glob_pattern = "!*{spec,test,json,yaml}*"})<CR>',
	{ desc = "Live Grep Code" }
)

telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")
