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

  -- git plugins
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter' -- shows a git diff in the sign column.
  use 'lewis6991/gitsigns.nvim'

  -- style
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
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
  -- use 'karb94/neoscroll.nvim' -- smooth scrolling.
  use 'kyazdani42/nvim-tree.lua'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- tools
  use 'junegunn/vim-easy-align'
  -- use 'liuchengxu/vim-which-key'
  use 'voldikss/vim-floaterm'
  use 'akinsho/toggleterm.nvim'
  use 'mg979/vim-visual-multi'
  use {
    'liuchengxu/vim-clap',
    run = ':Clap install-binary!'
  }
  use 'numToStr/Comment.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  -- use 'glepnir/lspsaga.nvim'
  use 'tami5/lspsaga.nvim'
  use 'williamboman/nvim-lsp-installer'
  -- use 'tamago324/nlsp-settings.nvim'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  -- rename like vscode, need at least one lsp client.
  use 'filipdutescu/renamer.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'folke/lsp-colors.nvim'

  -- completion

  use 'jiangmiao/auto-pairs'
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- language
  -- go
  use 'fatih/vim-go'
  use 'dgryski/vim-godef'
  use 'ray-x/go.nvim'

  -- hot reload
  use 'nvim-lua/plenary.nvim'

  use 'folke/which-key.nvim'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
