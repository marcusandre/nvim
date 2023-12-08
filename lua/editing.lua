-- Comment
require('Comment').setup()

-- Conform
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { { 'eslint_d' } },
    javascriptreact = { { 'eslint_d' } },
    typescript = { { 'eslint_d' } },
    typescriptreact = { { 'eslint_d' } },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
