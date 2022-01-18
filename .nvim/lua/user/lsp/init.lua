local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = {
      enable = true,
      priority = 20,
    },
    update_in_insert = false,
  }
)

require('user.lsp.lsp-installer')
require('user.lsp.lsp-colors')
require('user.lsp.lsp-signature')
require('user.lsp.lsp-golang')
