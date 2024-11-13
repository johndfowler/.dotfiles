-- Declare vim as global
---@diagnostic disable: undefined-global
local vim = vim

-- Ensure Packer is installed
local function ensure_packer()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Require necessary modules
local use = require('packer').use

-- Plugin configuration
return require('packer').startup(function()
  -- Core
  use 'wbthomason/packer.nvim'

  -- LSP & Development
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  }

  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- NerdTree (file explorer)
  use 'preservim/nerdtree'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Lualine configuration
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          section_separators = {'', ''},
          component_separators = {'', ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
      }
    end
  }

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Color schemes
  use 'altercation/vim-colors-solarized'
  use 'arcticicestudio/nord-vim'
  use 'ayu-theme/ayu-vim'
  use 'cocopon/iceberg.vim'
  use 'crusoexia/vim-monokai'
  use 'dracula/vim'
  use 'drewtempelmeyer/palenight.vim'
  use 'EdenEast/nightfox.nvim'
  use 'Everblush/everblush.nvim'
  use 'folke/tokyonight.nvim'
  use 'glepnir/zephyr-nvim'
  use 'gruvbox-community/gruvbox'
  use 'ishan9299/nvim-solarized-lua'
  use 'jacoborus/tender.vim'
  use 'jnurmine/Zenburn'
  use 'lifepillar/vim-solarized8'
  use 'marko-cerovac/material.nvim'
  use 'mhartington/oceanic-next'
  use 'Mofiqul/vscode.nvim'
  use 'NLKNguyen/papercolor-theme'
  use 'projekt0n/github-nvim-theme'
  use 'rakr/vim-one'
  use 'rakr/vim-two-firewatch'
  use 'ray-x/aurora'
  use 'ray-x/starry.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'romainl/Apprentice'
  use 'rose-pine/neovim'
  use 'sainnhe/edge'
  use 'sainnhe/everforest'
  use 'sainnhe/forest-night'
  use 'sainnhe/sonokai'
  use 'savq/melange'
  use 'shaunsingh/moonlight.nvim'
  use 'shaunsingh/nord.nvim'
  use 'shaunsingh/seoul256.nvim'
  use 'sonph/onehalf'
  use 'tomasr/molokai'
  use 'tiagovla/tokyodark.nvim'
  use 'Yagua/nebulous.nvim'
  use 'yonlu/omni.vim'

  -- Commenting
  use 'numToStr/Comment.nvim'

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Surround
  use 'tpope/vim-surround'

  -- Indentation guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- Startup screen
  use 'goolord/alpha-nvim'

  -- Additional Plugins
  use 'akinsho/bufferline.nvim' -- Buffer line
  use 'akinsho/toggleterm.nvim' -- Terminal toggler
  use 'folke/trouble.nvim' -- Diagnostics list
  use 'folke/which-key.nvim' -- Keybinding helper
  use 'kkoomen/vim-doge' -- Auto docstring
  use 'lewis6991/impatient.nvim' -- Speed up loading Lua modules
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
  use 'nvim-lua/popup.nvim' -- Popup API
  use 'nvim-telescope/telescope-fzy-native.nvim' -- Fuzzy Finder Algorithm
  use 'norcalli/nvim-colorizer.lua' -- Color highlighter

  -- vim-matchup
  use 'andymass/vim-matchup'

  -- vim-misc
  use 'xolox/vim-misc'

  if packer_bootstrap then
    require('packer').sync()
  end
end)