-- https://github.com/neovim/neovim/pull/22668
if vim.fn.has('nvim-0.9') == 1 then vim.loader.enable() end

-- Set <Space> as the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local bootstrap_paq = require('m.utils').bootstrap_paq

bootstrap_paq({
  -- Let 'paq' manage itself
  'savq/paq-nvim',
  'nvim-lua/plenary.nvim',

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Editing
  'numToStr/Comment.nvim',
  'stevearc/conform.nvim',
  'tpope/vim-sleuth',
  'smjonas/inc-rename.nvim',
  'ethanholz/nvim-lastplace',

  -- Mini
  'echasnovski/mini.nvim',

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'folke/neodev.nvim',
  'j-hui/fidget.nvim',
  'pmizio/typescript-tools.nvim',

  -- Git
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Testing
  'vim-test/vim-test',
  'andythigpen/nvim-coverage',

  -- UI
  'folke/which-key.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'folke/tokyonight.nvim',

  -- Others
  'stevearc/oil.nvim',
  'tpope/vim-projectionist',
  'b0o/schemastore.nvim',
})

-- Core
require('m.globals')
require('m.options')
require('m.keymaps')

-- Plugins
require('treesitter')
require('lsp')
require('editing')
require('mini')
require('ui')
require('git')
require('testing')
