return {
  'stevearc/oil.nvim',
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
