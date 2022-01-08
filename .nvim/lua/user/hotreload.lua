function unload_lua_namespace(prefix)
  local prefix_with_dot = prefix .. '.'
  for key, value in pairs(package.loaded) do
    if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then
      package.loaded[key] = nil
    end
  end
end

-- r = reload vimrc
-- vimp.nnoremap('<leader>r', function()
--   -- Remove all previously added vimpeccable maps
--   vimp.unmap_all()
--   -- Unload the lua namespace so that the next time require('config.X') is called
--   -- it will reload the file
--   unload_lua_namespace('config')
--   -- Make sure all open buffers are saved
--   vim.cmd('silent wa')
--   -- Execute our vimrc lua file again to add back our maps
--   dofile(vim.fn.stdpath('config') .. '/init.lua')
--
--   print("Reloaded vimrc!")
-- end)

-- elder reload version
-- local status_ok, reload = pcall(require, 'nvim-reload')
-- if not status_ok then
--   return
-- end

-- local plugin_dirs = vim.fn.stdpath 'data' .. '/site/pack/*/start/*'
-- 
-- reload.vim_reload_dirs = {
--   vim.fn.stdpath('config'),
--   plugin_dirs
-- }
-- 
-- reload.lua_reload_dirs = {
--   vim.fn.stdpath('config'),
--   plugin_dirs
-- }
