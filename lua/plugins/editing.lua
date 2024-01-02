return {
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          go = { 'goimports', 'gofumpt' },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'tpope/vim-projectionist',
    config = function() end,
  },
  {
    'smjonas/inc-rename.nvim',
    keys = {
      {
        '<leader>rn',
        function() return ':IncRename ' .. vim.fn.expand('<cword>') end,
        desc = 'IncRename',
        expr = true,
      },
    },
    opts = {},
  },
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require('nvim-lastplace').setup({
        lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
        lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'hgcommit' },
        lastplace_open_folds = true,
      })
    end,
  },
}
