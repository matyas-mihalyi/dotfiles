vim.api.nvim_create_autocmd('InsertLeave',  {
  pattern = "*",
  callback = function()
    if (vim.bo.filetype ~= "netrw")
      then
        vim.cmd(":w")
      end
  end
})
