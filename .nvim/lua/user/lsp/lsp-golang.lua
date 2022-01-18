local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmplsp_status_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmplsp_status_ok then
  capabilities = cmp_lsp.update_capabilities(capabilities)
end

lspconfig.gopls.setup {
  cmd = { "gopls", "--remote=auto" },
  capabilities = capabilities,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  }
}

