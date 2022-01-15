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

  -- git plugins
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter' -- shows a git diff in the sign column.
  use 'lewis6991/gitsigns.nvim'

  -- style
  use 'kien/rainbow_parentheses.vim'
  use 'nathanaelkane/vim-indent-guides'
  use 'ojroques/vim-scrollstatus'
  use 'glepnir/galaxyline.nvim' -- statusline
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'dhruvasagar/vim-zoom'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- navigation
  use 'pechorin/any-jump.vim'
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

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'tami5/lspsaga.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'filipdutescu/renamer.nvim' -- rename like vscode, need at least one lsp client.
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'folke/lsp-colors.nvim'

  -- completion

  use 'jiangmiao/auto-pairs'
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  use 'hrsh7th/nvim-cmp'

  -- snippet
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- language
  -- go
  use 'fatih/vim-go'
  use 'dgryski/vim-godef'
  use 'ray-x/go.nvim'

  use 'folke/which-key.nvim'

  -- wait for try
  -- use 'glepnir/lspsaga.nvim'
  -- use 'tamago324/nlsp-settings.nvim'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  -- use 'nvim-pack/nvim-spectre' -- regex search panel

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
