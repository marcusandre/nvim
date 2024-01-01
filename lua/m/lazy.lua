local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO:
-- 'williamboman/mason.nvim',
-- 'williamboman/mason-lspconfig.nvim',
-- 'neovim/nvim-lspconfig',
-- 'folke/neodev.nvim',
-- 'j-hui/fidget.nvim',
-- 'pmizio/typescript-tools.nvim',

require('lazy').setup({
  import = 'plugins',
  install = {
    missing = true,
    colorscheme = { 'tokyonight' },
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
})
