local status_ok, config = pcall(require, 'cmp-tabnine.config')
if not status_ok then
  return
end

config:setup({
max_lines = 1000,
  max_num_results = 20,
  sort = true,
})
