-- Install plugins.
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and please reopen Neovim..."

  vim.cmd [[packadd packer.nvim]]
end

-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  -- plugin manager
  use 'wbthomason/packer.nvim'

  -- themes
  use 'morhetz/gruvbox'
  use 'glepnir/zephyr-nvim'
  use 'EdenEast/nightfox.nvim'
  use 'tanvirtin/monokai.nvim'
  use 'fatih/molokai'

  -- git plugins
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter' -- shows a git diff in the sign column.
  use 'lewis6991/gitsigns.nvim'

  -- style
  use 'kien/rainbow_parentheses.vim'
  use 'ojroques/vim-scrollstatus'
  use 'NTBBloodbath/galaxyline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'stevearc/dressing.nvim' -- improve the default vim.ui interfaces
  use 'akinsho/bufferline.nvim'
  use 'goolord/alpha-nvim'
  use 'SmiteshP/nvim-gps' -- show the context cursor position in status bar.
  use 'ThemerCorp/themer.lua' -- simple, minimal highlighter plugin

  -- navigation
  use 'psliwka/vim-smoothie'
  use 'mihaifm/bufstop'
  use {
    'junegunn/fzf',
    run = vim.fn['fzf#install()']
  }
  use 'junegunn/fzf.vim'
  use 'karb94/neoscroll.nvim' -- smooth scrolling.
  use 'kyazdani42/nvim-tree.lua'
  use 'easymotion/vim-easymotion'
  use 'ahmedkhalf/project.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'folke/zen-mode.nvim'

  -- tools
  use 'junegunn/vim-easy-align'
  use 'voldikss/vim-floaterm'
  use 'akinsho/toggleterm.nvim'
  use 'mg979/vim-visual-multi'
  use {
    'liuchengxu/vim-clap',
    run = ':Clap install-binary!'
  }
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround' -- change and add parentheses, brackets, quotes, etc.. surroundings in pairs
  use 'nvim-lua/plenary.nvim'
  use 'famiu/bufdelete.nvim' -- delete buffer without losing the window layout
  use 'lewis6991/impatient.nvim'
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'rcarriga/nvim-notify' -- fancy notify
  use "norcalli/nvim-colorizer.lua" -- show color in editor
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      }
  }
  use 'dstein64/vim-startuptime'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'tami5/lspsaga.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'filipdutescu/renamer.nvim' -- rename like vscode, need at least one lsp client.
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'folke/lsp-colors.nvim'
  use 'rmagatti/goto-preview'

  -- completion

  use 'jiangmiao/auto-pairs'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }

  -- snippet
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- language
  -- go
  use 'fatih/vim-go'
  use 'dgryski/vim-godef'
  use 'ray-x/go.nvim'

  -- markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = 'markdown',
  }

  use 'folke/which-key.nvim'

  ---- some plugins have been tried, make a snapshot list for some day.
  -- use 'nathanaelkane/vim-indent-guides' -- make the indent has block color.

  ---- wait for try
  -- 'tamago324/nlsp-settings.nvim'
  -- 'jose-elias-alvarez/null-ls.nvim'
  -- 'nvim-pack/nvim-spectre' -- regex search panel
  -- 'ThePrimeagen/harpoon'
  -- 'nyngwang/NeoZoom.lua'
  -- 'tpope/vim-repeat' -- enable repeating supported plugin maps with `.`

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

