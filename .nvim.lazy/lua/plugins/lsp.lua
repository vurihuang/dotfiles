local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
}

-- function M.config()
--   local nvim_lsp = require("lspconfig")
--
--   local on_attach = function(_, bufnr)
--     vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--   end
--
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true,
--   }
--
--   -- -------------------------- common lsp server ----------------------
--   -- local servers = { "bashls", "lua_ls" }
--   -- ---------------------------------------------------------------
--   -- for _, lsp in ipairs(servers) do
--   --   nvim_lsp[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
--   -- end
--
--   -- -------------------- go lsp settings -- --------------------
--   nvim_lsp.gopls.setup({
--     cmd = { "gopls", "--remote=auto" },
--     on_attach = on_attach,
--     capabilities = capabilities,
--     root_dir = nvim_lsp.util.root_pattern(".git", "go.mod"),
--     init_options = { usePlaceholders = true, completeUnimported = true },
--     settings = {
--       gopls = {
--         gofumpt = true,
--         usePlaceholders = true,
--         completeUnimported = true,
--         experimentalPostfixCompletions = true,
--         analyses = {
--           unusedparams = true,
--           shadow = true,
--           nilness = true,
--           unusedwrite = true,
--           useany = true,
--         },
--         staticcheck = true,
--       },
--     },
--   })
-- end

return M
