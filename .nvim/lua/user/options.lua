local options = {
  backup = false, -- do not create a backup file.
  clipboard = 'unnamedplus', -- allow to access the system clipboard.
  cmdheight = 1, -- more spaces in the command line for displaying messages.
  conceallevel = 0, -- so that the `` symbol is visible in markdown files.
  fileencoding = 'utf-8',
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  pumheight = 10,
  mouse = 'a',
  showmode = false,
  showtabline = 2,
  smartindent = true,
  splitbelow = true,
  number = true,
  splitright = true,
  swapfile = false,
  undofile = true,
  writebackup = false,
  expandtab = true, -- use the appropriate number of spaces to insert a <tab>.
  termguicolors = true,
  updatetime = 100,
  shiftwidth = 2,
  cursorline = true,
  relativenumber = false,
  signcolumn = 'yes',
  showcmd = true,
  linespace = 2,
  autochdir = true,
  tabstop = 2,
  softtabstop = 2,
  wildmenu = true,
  numberwidth = 2,
  scrolloff = 5,
  sidescrolloff = 8,
  list = false,
  wrap = false,
  autoindent = true,
  inccommand = 'split',
  listchars = 'tab:| ,trail:▫',
  viewoptions = 'cursor,folds,slash,unix', -- changes the effect of :mkview command.
  colorcolumn = '120',
  guicursor = 'n-v-c-sm:block', -- let the block cursor everywhere.
  virtualedit = 'block',
  lazyredraw = true, -- the screen will not be redrawn while executin macros, registers and other command that have not been typed.
  -- completeopt = 'longest,noinsert,menuone,noselect,preview', -- for insert mode completion.
  completeopt = { 'menuone', 'noselect' }, -- mostly just for jump cmp.
  hidden = true, -- a buffer becomes hidden when it is abandoned.
  ttimeoutlen = 50, -- time in milliseconds to wait for a key code sequence to complete.
  timeoutlen = 300, -- time in milliseconds to wait for a mapped sequence to complete.
  indentexpr = '', -- expression which is evaluted to obtain the proper indent for a line.
  tw = 0, -- maximum width of text that is being inserted, a longer line will be broken after while space to get this width.
  foldmethod = 'indent',
  foldlevel = 99,
  foldenable = true,
  re = 0, -- regexpengine
  laststatus = 2,
  background = 'dark',
  fillchars = 'eob: ' -- hide the tilde sign onn blank lines
}

vim.opt.shortmess:append "c" -- avoid the hit-enter prompts caused by file messages(don't give `ins-completion-menu` messages)

for k, v in pairs(options) do
  vim.opt[k] = v
end

local glb_opts = {
  mapleader = ' ',
  indent_guides_enable_on_vim_startup = 1,
  indent_guides_start_level = 2
}

for k, v in pairs(glb_opts) do
  vim.g[k] = v
end

vim.cmd [[filetype on]]
vim.cmd [[filetype plugin on]]
vim.cmd [[filetype plugin indent on]]
vim.cmd [[set whichwrap+=<,>,[,],h,l]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=tc]]
vim.cmd [[set noshowmode]]
-- avoid the cursor will be missing.
vim.cmd [[set guioptions-=L]]
vim.cmd [[set guioptions-=l]]

-- vim.cmd [[
--   augroup reload_user_config
--     autocmd!
--     autocmd BufWritePost *.lua Reload
--   augroup end
-- ]]

vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
-- use to buffer switch
vim.cmd [[
  if !exists("g:lasttab")
    let g:lasttab = 1
  endif
]]

