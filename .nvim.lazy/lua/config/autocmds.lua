-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

vim.cmd([[
  autocmd BufNewFile,BufRead .*rc,.*aliases setfiletype sh
  autocmd BufNewFile,BufRead .ideavimrc setfiletype vim
  autocmd BufNewFile,BufRead .mmd setfiletype markdown " mermaid graph
  autocmd BufRead PROJECT setfiletype yaml
  autocmd BufNewFile,BufRead Dockerfile.* setfiletype dockerfile
]])
