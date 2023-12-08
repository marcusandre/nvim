-- General
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', '<leader><leader>', '<Cmd>:b#<CR>', { desc = 'Alternate Buffer' })
vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>', { desc = 'Remove highlights' })

-- Completion
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Buffers
vim.keymap.set('n', '<leader>bd', '<Cmd>lua MiniBufremove.delete()<CR>', { desc = 'Delete' })
vim.keymap.set('n', '<leader>bD', '<Cmd>lua MiniBufremove.delete({ force = true })<CR>', { desc = 'Delete!' })

-- Git
vim.keymap.set('n', '<leader>gg', '<Cmd>Git<CR>', { desc = 'Git' })

vim.keymap.set('n', '<leader>gA', '<Cmd>lua require("gitsigns").stage_buffer()<CR>', { desc = 'Add buffer' })
vim.keymap.set('n', '<leader>ga', '<Cmd>lua require("gitsigns").stage_hunk()<CR>', { desc = 'Add (stage) hunk' })
vim.keymap.set('n', '<leader>gb', '<Cmd>lua require("gitsigns").blame_line()<CR>', { desc = 'Blame line' })
vim.keymap.set('n', '<leader>gp', '<Cmd>lua require("gitsigns").preview_hunk()<CR>', { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>gq', '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>', { desc = 'Quickfix hunks' })
vim.keymap.set('n', '<leader>gu', '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', { desc = 'Undo stage hunk' })
vim.keymap.set(
  'n',
  '<leader>gX',
  '<Cmd>lua require("gitsigns").reset_buffer()<CR>',
  { desc = 'Discard (reset) buffer' }
)
vim.keymap.set('n', '<leader>gx', '<Cmd>lua require("gitsigns").reset_hunk()<CR>', { desc = 'Discard (reset) hunk' })

vim.keymap.set('n', '[h', '<Cmd>Gitsigns prev_hunk<CR>zvzz', { desc = 'Goto previous hunk' })
vim.keymap.set('n', ']h', '<Cmd>Gitsigns next_hunk<CR>zvzz', { desc = 'Goto next hunk' })

-- Mini.Pick
vim.keymap.set('n', '<leader>/', '<Cmd>lua MiniPick.builtin.grep_live()<CR>', { desc = 'Grep' })
vim.keymap.set('n', '<leader>fb', '<Cmd>lua MiniPick.builtin.buffers()<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>ff', '<Cmd>lua MiniPick.builtin.files()<CR>', { desc = 'Files' })
vim.keymap.set('n', '<leader>fh', '<Cmd>lua MiniPick.builtin.help()<CR>', { desc = 'Help' })
vim.keymap.set('n', '<leader>fr', '<Cmd>lua MiniPick.builtin.resume()<CR>', { desc = 'Resume' })

-- Mini.Extra
vim.keymap.set('n', ',', '<Cmd>lua MiniExtra.pickers.buf_lines()<CR>', { desc = 'Buffer lines' })
vim.keymap.set('n', '<leader>fa', '<Cmd>lua MiniExtra.pickers.git_hunks()<CR>', { desc = 'Git Hunks' })
vim.keymap.set('n', '<leader>fd', '<Cmd>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fe', '<Cmd>lua MiniExtra.pickers.explorer()<CR>', { desc = 'Explorer' })
vim.keymap.set('n', '<leader>fg', '<Cmd>lua MiniExtra.pickers.git_files()<CR>', { desc = 'Git Files' })
vim.keymap.set('n', '<leader>fk', '<Cmd>lua MiniExtra.pickers.keymaps()<CR>', { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fo', '<Cmd>lua MiniExtra.pickers.oldfiles()<CR>', { desc = 'Oldfiles' })
vim.keymap.set('n', '<leader>ft', '<Cmd>lua MiniExtra.pickers.treesitter()<CR>', { desc = 'Treesitter' })
