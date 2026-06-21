return {
  "smithbm2316/centerpad.nvim",
  config = function()
    local function toggle_centerpad()
      require('centerpad').toggle({ leftpad = 36, rightpad = 36 })
    end
    vim.keymap.set('n', '<leader>z', toggle_centerpad, {
      silent = true,
      noremap = true
    })
  end
}
