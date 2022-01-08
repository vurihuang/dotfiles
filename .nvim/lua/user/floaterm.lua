local opts = {
  floaterm_keymap_toggle = '<F3>',
  floaterm_wintitle = 1,
  floaterm_width = 0.8,
  floaterm_height = 0.8,
}

for k, v in pairs(opts) do
  vim.g[k] = v
end
