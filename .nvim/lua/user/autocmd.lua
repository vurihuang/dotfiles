local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for gn, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..gn)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local cmd = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(cmd)
    end
    vim.api.nvim_command('augroup END')
  end
end

function autocmd.load_autocmds()
  local definitions = {
    bufs = {
      {"BufWritePost",[[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]};
    };

    wins = {
      -- Highlight current line only on focused window
      {"BufEnter,InsertLeave", "*", [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]]};
      {"BufLeave,InsertEnter", "*", [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]]};
      -- Equalize window dimensions when resizing vim window
      {"VimResized", "*", [[tabdo wincmd =]]};
      -- Force write shada on leaving nvim
      {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]};
      -- Check if file changed when its window is focus, more eager than 'autoread'
      {"FocusGained", "* checktime"};
    };
  }
  autocmd.nvim_create_augroups(definitions)

end

autocmd.load_autocmds()
