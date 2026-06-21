vim.api.nvim_create_user_command('SearchWord', function()
  local word = vim.fn.expand('<cword>')
  require('telescope.builtin').live_grep({
    glob_pattern = "!*{spec,test}",
    default_text = word
  })
end, {})
