-- Test
vim.g['test#strategy'] = 'neovim'
vim.g['test#neovim#start_normal'] = '1'
vim.g['test#neovim#term_position'] = 'vert'

-- Coverage
require('coverage').setup()
