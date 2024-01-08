return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
        },
      })

      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    dependencies = 'tpope/vim-sleuth',
    opts = {
      indent = {
        char = '▏',
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    keys = {
      {
        '<leader>on',
        function() require('notify').dismiss({ silent = true, pending = true }) end,
        desc = 'Dismiss all Notifications',
      },
    },
    opts = {
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
      on_open = function(win) vim.api.nvim_win_set_config(win, { zindex = 100 }) end,
    },
    init = function() vim.notify = require('notify') end,
  },
  -- {
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --   main = 'ibl',
  --   config = function()
  --     require('lsp_lines').setup()
  --
  --     vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
  --   end,
  -- },
}
