local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

local m = {
  m = {
    name = 'Markdown',
    p = { '<cmd>MarkdownPreview<cr>', 'Preview' },
    t = { '<cmd>MarkdownPreviewToggle<cr>', 'Preview toggle' },
  }
}

local opts = {
  mode    = 'n',
  prefix  = '<leader>',
  buffer  = nil,
  silent  = true,
  noremap = true,
  nowait  = true,
}

wk.register(m, opts)
