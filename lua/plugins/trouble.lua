return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    auto_open = true,
    auto_close = true,
  },
  keys = {
    -- stylua: ignore start
    { '<leader>xd', function() require('trouble').toggle('document_diagnostics') end,                desc = 'diagnostics' },
    { '<leader>xl', function() require('trouble').toggle('loclist') end,                             desc = 'loclist' },
    { '<leader>xq', function() require('trouble').toggle('quickfix') end,                            desc = 'quickfix' },
    { '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end,               desc = 'diagnostics (workspace)' },
    { '<leader>xx', function() require('trouble').toggle() end,                                      desc = 'toggle' },
    { 'gR',         function() require('trouble').toggle('lsp_references') end,                      desc = 'references' },
    { ']d',         function() require('trouble').next({ skip_groups = true, jump = true }) end,     desc = 'next diagnostic' },
    { '[d',         function() require('trouble').previous({ skip_groups = true, jump = true }) end, desc = 'previous diagnostic' },
    -- stylua: ignore end
  },
}
