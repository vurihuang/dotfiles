local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', ';', ':', { noremap = true })
keymap('', '<space>', '<nop>', opts)
keymap('', '<F1>', '<nop>', opts)
keymap('i', '<F1>', '<nop>', opts)

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- navigation
keymap('i', 'jk', '<esc>', opts)
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('n', '<esc><esc>', '<cmd>nohlsearch<cr>', opts)

-- plugins
--
-- nvim-tree
keymap('n', '<f1>', '<cmd>NvimTreeToggle<cr>', opts)
keymap('i', '<f1>', '<cmd>NvimTreeToggle<cr>', opts)

-- lspsaga
keymap('i', '<f4>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', '<f4>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)

-- symbol outline
keymap('i', '<f3>', '<cmd>SymbolsOutline<cr>', opts)
keymap('n', '<f3>', '<cmd>SymbolsOutline<cr>', opts)

-- debug
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)

keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
