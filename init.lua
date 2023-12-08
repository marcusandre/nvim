-- https://github.com/neovim/neovim/pull/22668
if vim.fn.has('nvim-0.9') == 1 then vim.loader.enable() end

-- Set <Space> as the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local bootstrap_paq = require('m.utils').bootstrap_paq

bootstrap_paq({
  -- Let 'paq' manage itself
  'savq/paq-nvim',

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Editing
  'numToStr/Comment.nvim',
  'tpope/vim-sleuth',

  -- Mini
  'echasnovski/mini.nvim',

  -- LSP
  'folke/neodev.nvim',

  -- Git
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- UI
  'folke/which-key.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'folke/tokyonight.nvim',
})

-- Core
require('keymaps')

-- Plugins
require('treesitter')
require('editing')
require('mini')
require('ui')
require('git')
