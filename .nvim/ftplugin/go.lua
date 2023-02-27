local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap

-- keymap('n', '<F5>', '<cmd>GoDebugTestFunc<cr>', opts)

local mappings = {
  d = {
    name = 'Debug',
    -- S    = { '<cmd>GoDebugStart<cr>', 'Start' },
    -- T    = { '<cmd>GoDebugTestFunc<cr>', 'Test func' },
    -- Q    = { '<cmd>GoDebugStop<cr>', 'Quit debug' },
    -- n    = { '<cmd>GoDebugNext<cr>', 'Next' },
    -- s    = { '<cmd>GoDebugStep<cr>', 'Step' },
    -- o    = { '<cmd>GoDebugStepOut<cr>', 'Step out' },
    -- b    = { '<cmd>GoDebugBreakpoint<cr>', 'Breakpoint' },
    -- p    = { '<cmd>call go#debug#Print(expand("<cword>"))<cr>', 'Print variable' },
    -- c    = { '<cmd>GoDebugContinue<cr>', 'Continue' }
    b = { '<cmd>lua require"dap".toggle_breakpoint()<cr>', 'Breakpoint' },
    B = { '<cmd>lua require"dap".set_breakpoint(vim.fn.input "[Condition] >")<cr>', 'Breakpoint with condition' },
    t = { '<cmd>lua require"dapui".toggle()<cr>', 'Toggle UI' },
    k = { '<cmd>lua require"dapui".eval()<cr>', 'Eval' },
    T = { '<cmd>lua require"dap".terminate()<cr>', 'Terminate' },
  }
}

local m_opts = {
  mode    = 'n',
  prefix  = '<leader>',
  buffer  = nil,
  silent  = true,
  noremap = true,
  nowait  = true,
}

wk.register(mappings, m_opts)
