vim.cmd [[
  autocmd BufNewFile,BufRead .*rc,.*aliases setfiletype sh
  autocmd BufNewFile,BufRead .ideavimrc setfiletype vim
  autocmd BufNewFile,BufRead .mmd setfiletype markdown " mermaid graph
  autocmd BufRead PROJECT setfiletype yaml
  autocmd BufNewFile,BufRead Dockerfile.* setfiletype dockerfile
]]

