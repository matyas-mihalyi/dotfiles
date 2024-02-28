return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true,
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
  opts = {
      -- put this to setup function and press <a-e> to use fast_wrap
      fast_wrap = {},
      check_ts = true,
  }
}
