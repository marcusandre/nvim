return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>oo', '<Cmd>Oil<CR>', desc = 'Oil' },
  },
  config = function()
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
  end,
}
