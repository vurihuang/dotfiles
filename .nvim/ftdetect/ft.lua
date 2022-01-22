vim.cmd [[
  autocmd BufNewFile,BufRead .*rc,.aliases setfiletype sh
  autocmd BufNewFile,BufRead .ideavimrc setfiletype vim
  autocmd BufRead PROJECT setfiletype yaml
]]

