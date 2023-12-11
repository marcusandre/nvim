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
    typescript = { { 'eslint_d' } },
    typescriptreact = { { 'eslint_d' } },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Comment
require('Comment').setup()
