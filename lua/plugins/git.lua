return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        numhl = false,
        linehl = false,
        watch_gitdir = { interval = 1000 },
      })
    end,
  },
  {
    'tpope/vim-fugitive',
    config = function() end,
  },
  {
    'tpope/vim-rhubarb',
    config = function() end,
  },
}
