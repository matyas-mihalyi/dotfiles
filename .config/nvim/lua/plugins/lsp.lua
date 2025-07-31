local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  if not vim.tbl_isempty(eslintrc) then
    return true
  end
  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end
  return false
end
return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "html", "cssls", "eslint", "jsonls", "emmet_ls", "yamlls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup language servers.
      require("typescript-tools").setup({
        settings = {
          expose_as_code_action = { "fix_all", "add_missing_imports" },
        },
      })
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      -- lspconfig.ts_ls.setup({})
      lspconfig.clangd.setup({})

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      --Enable (broadcasting) snippet capability for completion
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "ejs" },
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      lspconfig.angularls.setup({})
      lspconfig.yamlls.setup({})

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "typescriptreact",
          "vue",
        },
      })

      lspconfig.cds_lsp.setup({
        default_config = {
          cmd = {
            vim.fn.expand("cds-lsp"),
            "--stdio",
          },
          filetypes = { "cds" },
          root_dir = lspconfig.util.root_pattern(".git", "package.json"),
          settings = {},
        },
      })


      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<space>dq", vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })
    end,
  },
}
