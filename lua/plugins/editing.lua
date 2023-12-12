-- Oil
require('oil').setup({
  default_file_explorer = true,
  columns = {
    'type',
    'icon',
  },
  view_options = {
    show_hidden = true,
    sort = {
      { 'type', 'asc' },
      { 'name', 'asc' },
    },
  },
})

-- Conform
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Comment
require('Comment').setup()

-- ethanholz/nvim-lastplace
require('nvim-lastplace').setup({
  lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
  lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'hgcommit' },
  lastplace_open_folds = true,
})
