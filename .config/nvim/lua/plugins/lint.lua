return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d", "eslint" },
      typescript = { "eslint_d", "eslint" },
      javascriptreact = { "eslint_d", "eslint" },
      typescriptreact = { "eslint_d", "eslint" },
      svelte = { "eslint_d", "eslint" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>lf", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
