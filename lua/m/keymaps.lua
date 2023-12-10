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

-- LSP
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Actions' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', 'gD', '<Cmd>Pick lsp scope="declaration"<CR>', { desc = 'Declaration (LSP)' })
vim.keymap.set('n', 'gd', '<Cmd>Pick lsp scope="definition"<CR>', { desc = 'Definition (LSP)' })
vim.keymap.set('n', 'gi', '<Cmd>Pick lsp scope="implementation"<CR>', { desc = 'Implementation (LSP)' })
vim.keymap.set('n', 'gl', '<Cmd>Pick lsp scope="type_definition"<CR>', { desc = 'Type definition (LSP)' })
vim.keymap.set('n', 'gr', '<Cmd>Pick lsp scope="references"<CR>', { desc = 'References (LSP)' })
vim.keymap.set('n', 'gw', '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = 'Grep word (LSP)' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Information' })

-- LSP (Leader)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Declaration' })
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Definition' })
vim.keymap.set('n', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format' })
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'Implementation' })
vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, { desc = 'References' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature' })
vim.keymap.set('n', '<leader>ly', vim.lsp.buf.type_definition, { desc = 'Type Definition' })
vim.keymap.set('v', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('x', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format' })

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
vim.keymap.set(
  'n',
  '[e',
  function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  { desc = 'Previous Diagnostic' }
)
vim.keymap.set(
  'n',
  ']e',
  function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  { desc = 'Next Diagnostic' }
)

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

-- Explore
vim.keymap.set('n', '<leader>ee', '<Cmd>lua MiniFiles.open()<CR>', { desc = 'Files' })

-- Testing
vim.keymap.set('n', '<leader>tF', '<Cmd>TestFile --coverage<CR>', { desc = 'Test: file (coverage)' })
vim.keymap.set('n', '<leader>tL', '<Cmd>TestLast --coverage<CR>', { desc = 'Test: last (coverage)' })
vim.keymap.set('n', '<leader>tN', '<Cmd>TestNearest --coverage<CR>', { desc = 'Test: nearest (coverage)' })
vim.keymap.set('n', '<leader>tS', '<Cmd>TestSuite --coverage<CR>', { desc = 'Test: suite (coverage)' })
vim.keymap.set('n', '<leader>tf', '<Cmd>TestFile<CR>', { desc = 'Test: file' })
vim.keymap.set('n', '<leader>tl', '<Cmd>TestLast<CR>', { desc = 'Test: last' })
vim.keymap.set('n', '<leader>tn', '<Cmd>TestNearest<CR>', { desc = 'Test: nearest' })
vim.keymap.set('n', '<leader>ts', '<Cmd>TestSuite<CR>', { desc = 'Test: suite' })
vim.keymap.set('n', '<leader>tv', '<Cmd>TestVisit<CR>', { desc = 'Test: visit' })
vim.keymap.set('n', '<leader>tc', '<Cmd>Coverage<CR>', { desc = 'Test: coverage' })

-- Other
vim.keymap.set('n', '<leader>oo', '<Cmd>only<CR>', { desc = 'Window: Only' })
