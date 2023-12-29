return {
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end,
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
    'tpope/vim-sleuth',
    config = function() end,
  },
  {
    'tpope/vim-projectionist',
    config = function() end,
  },
  {
    'smjonas/inc-rename.nvim',
    config = function() end,
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
