-- https://github.com/neovim/neovim/pull/22668
if vim.fn.has('nvim-0.9') == 1 then vim.loader.enable() end

-- Set <Space> as the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local bootstrap_paq = require('utils').bootstrap_paq

bootstrap_paq({
  -- Let 'paq' manage itself
  'savq/paq-nvim',

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Editing
  'numToStr/Comment.nvim',
  'stevearc/conform.nvim',
  'tpope/vim-sleuth',

  -- Mini
  'echasnovski/mini.nvim',

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'folke/neodev.nvim',
  'j-hui/fidget.nvim',

  -- Git
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- UI
  'folke/which-key.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'folke/tokyonight.nvim',

  -- Others
  'nvim-lua/plenary.nvim',
  'pmizio/typescript-tools.nvim',
})

-- Core
require('options')
require('keymaps')

-- Plugins
require('treesitter')
require('lsp')
require('editing')
require('mini')
require('ui')
require('git')
