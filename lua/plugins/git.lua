return {
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '' },
          topdelete = { text = '' },
          changedelete = { text = '▎' },
          untracked = { text = '▎' },
        },
        -- signs = {
        --   add = { text = "▒" },
        --   change = { text = "▒" },
        --   changedelete = { text = "▓" },
        --   delete = { text = "▓" },
        --   topdelete = { text = "▓" },
        --   untracked = { text = "░" },
        -- },
        preview_config = {
          border = 'none',
        },
        numhl = false,
        linehl = false,
        watch_gitdir = { interval = 1000 },
      })
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    event = 'VeryLazy',
    opts = {
      default_mappings = {
        ours = '<leader>g1',
        theirs = '<leader>g2',
        none = '<leader>g0',
        both = '<leader>g3',
        prev = '[x',
        next = ']x',
      },
      disable_diagnostics = true,
    },
  },
}
