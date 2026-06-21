local undodir = os.getenv("HOME") .. "/.undodir"
if not vim.loop.fs_stat(undodir) then
  vim.fn.mkdir(undodir, "p", 0700)
end
vim.opt.undodir = undodir
vim.opt.undofile = true
