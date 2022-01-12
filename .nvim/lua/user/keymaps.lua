vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('', '<space>', '<nop>', opts)
keymap('', '<F1>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('i', 'jk', '<esc>', opts)

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('n', '<esc><esc>', '<cmd>nohlsearch<cr>', opts)

-- plugins
--
-- nvim-tree
keymap('n', '<f1>', '<cmd>NvimTreeToggle<cr>', opts)

-- lspsaga
keymap('i', '<f4>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', '<f4>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)

-- scroll
keymap('n', '<C-u>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>', opts)
keymap('n', '<C-d>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>', opts)
