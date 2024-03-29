vim.g['gitgutter_signs'] = 0
-- vim.g['gitgutter_sign_modified']                = '•'
-- vim.g['gitgutter_sign_added']                   = '❖'
-- vim.cmd [[highlight GitGutterAdd guifg = '#A3E28B']]

vim.g['lazygit_floating_window_winblend']       = 0 -- transparency of floating window
vim.g['lazygit_floating_window_scaling_factor'] = 1.0 -- scaling factor for floating window
vim.g['lazygit_floating_window_corner_chars']   = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
vim.g['lazygit_use_neovim_remote']              = 1 -- for neovim-remote support

vim.cmd [[
  highlight GitGutterAdd    guifg=#009900 ctermfg=2
  highlight GitGutterChange guifg=#A3E28B ctermfg=3
  highlight GitGutterDelete guifg=#ff2222 ctermfg=1
]]
