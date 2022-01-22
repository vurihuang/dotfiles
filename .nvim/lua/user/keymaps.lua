vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('', '<space>', '<nop>', opts)
keymap('', '<F1>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- symbol outline
keymap('i', '<f3>', '<cmd>SymbolsOutline<cr>', opts)
keymap('n', '<f3>', '<cmd>SymbolsOutline<cr>', opts)

