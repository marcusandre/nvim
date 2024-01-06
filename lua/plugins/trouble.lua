return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    -- stylua: ignore start
    { '<leader>xd', function() require('trouble').toggle('document_diagnostics') end, desc = 'diagnostics' },
    { '<leader>xl', function() require('trouble').toggle('loclist') end, desc = 'loclist' },
    { '<leader>xq', function() require('trouble').toggle('quickfix') end, desc = 'quickfix' },
    { '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, desc = 'diagnostics (workspace)' },
    { '<leader>xx', function() require('trouble').toggle() end, desc = 'toggle' },
    { 'gR', function() require('trouble').toggle('lsp_references') end, desc = 'references' },
    -- stylua: ignore end
  },
  config = function() end,
}
