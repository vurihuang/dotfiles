local status_ok, _ = pcall(require, 'winresizer')
if not status_ok then
  return
end

local opts = {
  winresizer_vert_resize   = 5,
  winresizer_horiz_resize  = 5,
  winresizer_start_key     = '',
  winresizer_gui_start_key = '',
}

for k, v in ipairs(opts) do
  vim.g[k] = v
end
