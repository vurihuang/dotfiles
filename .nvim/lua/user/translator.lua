local status_ok, _ = pcall(require, 'vim-translator')
if not status_ok then
  return
end

local opts = {
  translator_default_engines = { 'google', 'haici', },
  translator_proxy_url       = 'http://127.0.0.1:1087',
  translator_window_type     = 'popup'
}

for k, v in ipairs(opts) do
  vim[k] = v
end
