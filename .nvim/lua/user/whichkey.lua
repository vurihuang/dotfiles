local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local m_opts = {
  mode = 'n',
  prefix = 'm',
  buffer = nil,
  silent = true,
  noremap = true,
  owait = true,
}

local m_mappings = {

}

local mappings = {
  b = {
    name = 'Buffer',
    l = { '<cmd>Buffers<cr>', 'Buffer list' },
    p = { '<cmd>bp<cr>', 'Buffer prev' },
    n = { '<cmd>bn<cr>', 'Buffer next' },
    d = { '<cmd>bd<cr>', 'Buffer delete' },
    s = { '<cmd>BufstopPreview', 'Buffer switch' },
  },

  f = {
    name = 'File',
    s = { '<cmd>w<cr>', 'File save' },
    l = { '<cmd>Files<cr>', 'File list' },
  },

  g = {
    name = 'Git/Goto',
    s = { '<cmd>Telescope git_status<cr>', 'Git status' },
    h = { '<cmd>Lspsaga hover_doc<cr>', 'Doc' },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
  },

  i = {
    name = 'Term',
    N = { '<cmd>FloatermNew --width=0.9 --height=0.8<cr>', 'New Terminal' },
    p = { '<cmd>FloatermPrev<cr>', 'Term previous' },
    n = { '<cmd>FloatermNext<cr>' , 'Term next' },
    t = { '<cmd>FloatermToggle<cr>', 'Term toggle' },
    f = { '<cmd>FloatermNew fzf<cr>', 'Term fzf' },
    g = { '<cmd>FloatermNew lazygit<cr>', 'Term lazygit' },
    r = { '<cmd>FloatermNew ranger<cr>', 'Term ranger'},
  },

  l = {
    name = 'Lsp',
    a = { '<cmd>Lspsaga range_code_action<cr>', 'Code action' },
    p = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostic jump previous' },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostic jump next' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
    h = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
    r = { '<cmd>Lspsaga rename<cr>', 'Rename' },
    w = { '<cmd>Lspsaga lsp_finder<cr>', 'Find definition and refernces' },
    v = { '<cmd>Lspsaga preview_definition<cr>', 'Preview definition' },
  },

  p = {
    name = 'Packer',
    i    = { '<cmd>PackerInstall<cr>', 'Install' },
    s    = { '<cmd>PackerSync<cr>', 'Sync' },
    S    = { '<cmd>PackerStatus<cr>', 'Status' }
  },

  s = {
    name = 'Search',
    b = { '<cmd>Telescope git_branches<cr>', 'Git checkout branch' },
    f = { '<cmd>Telescope find_files<cr>', 'Find files' },
    c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
    l = { '<cmd>Telescope resume<cr>', 'Last search' },
    M = { '<cmd>Telescope man_pages<cr>', 'Man pages' },
    K = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
    C = { '<cmd>Telescope commands<cr>', 'Commands' },
  },

  t = {
    name = 'Terminal',
    f = { '<cmd>ToggleTerm direction=float<cr>', 'Float'},
    h = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal'},
    v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical'},
  },

  w = {
    name  = 'Window',
    ['-'] = { '<c-w>s', 'Window split below' },
    ['|'] = { '<c-w>v', 'Window split right' },
    d     = { '<c-w>c', 'Window delete' },
    h     = { '<c-w>h', 'Window left' },
    j     = { '<c-w>j', 'Window below' },
    k     = { '<c-w>k', 'Window up' },
    l     = { '<c-w>l', 'Window right' },
    q     = { 'quit', 'Window quit' },
  },

  [','] = {
    name = 'Preferences',
    k = { '<cmd>e $HOME/dotfiles/.nvim/lua/user/keymaps.lua<cr>', 'Open keymaps' },
    p = { '<cmd>e $HOME/dotfiles/.nvim/lua/user/plugins.lua<cr>', 'Open plugins' },
    w = { '<cmd>e $HOME/dotfiles/.nvim/lua/user/whichkey.lua<cr>', 'Open whichkey' },
    i = { '<cmd>e $HOME/dotfiles/.nvim/init.lua<cr>', 'Open init' },
    o = { '<cmd>e $HOME/dotfiles/.nvim/lua/user/options.lua<cr>', 'Open options' },
    r = { '<cmd>Reload<cr>', 'Reload' },
  }
}


local x_mappings = {
  a = {
    name  = 'Align',
    ['='] = { "<cmd>'<,'>EasyAlign*=<cr>", 'Align with =' }
  },
}

local x_opts = {
 mode        = 'x',
 prefix      = '<leader>',
 buffer      = nil,
 silent      = true,
 noremap     = true,
 nowait      = true,
}

local v_mappings = {}
local v_opts = {}

local t_mappings = {
  i = {
    name = 'Term',
    p = { '<cmd>FloatermPrev<cr>', 'Term previous' },
    n = { '<cmd>FloatermNext<cr>', 'Term next' },
    t = { '<cmd>FloatermToggle<cr>', 'Term toggle' },
  }
}

local t_opts = {
  mode = 't',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(v_mappings, v_opts)
-- which_key.register(x_mappings, x_opts)
which_key.register(t_mappings, t_opts)