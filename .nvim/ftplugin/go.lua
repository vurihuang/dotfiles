vim.cmd [[
  augroup go
    autocmd!
    autocmd BufNewFile, BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  augroup END
]]

