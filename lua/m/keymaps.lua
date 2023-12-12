local utils = require('m.utils')
local map = vim.keymap.set

-- General
map('n', 'Q', '<nop>')
map('n', 'n', 'nzz')
map('n', '<leader><leader>', '<Cmd>:b#<CR>', { desc = 'Alternate Buffer' })
map('n', '<Esc>', '<Cmd>nohl<CR><Esc>', { desc = 'Remove highlights' })

-- Completion
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Windows
map(
  'n',
  '<M-Left>',
  '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = 'Decrease window width' }
)
map(
  'n',
  '<M-Down>',
  '"<Cmd>resize -"          . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = 'Decrease window height' }
)
map(
  'n',
  '<M-Up>',
  '"<Cmd>resize +"          . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = 'Increase window height' }
)
map(
  'n',
  '<M-Right>',
  '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = 'Increase window width' }
)

-- Buffers
map('n', '<leader>ba', '<Cmd>b#<CR>', { desc = 'Alternate' })
map('n', '<leader>bd', utils.delete_buffer, { desc = 'Delete' })
map('n', '<leader>bD', function() utils.delete_buffer(0, true) end, { desc = 'Delete!' })
map('n', '<leader>bq', utils.delete_other_buffers, { desc = 'Delete Others' })
map('n', '<leader>bQ', utils.delete_all_buffers, { desc = 'Delete All' })
map('n', '<leader>bs', utils.make_scratch_buffer, { desc = 'Scratch' })
map('n', '<leader>bw', utils.wipeout_buffer, { desc = 'Wipeout' })
map('n', '<leader>bW', function() utils.wipeout_buffer(0, true) end, { desc = { desc = 'Wipeout!' } })

-- LSP
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Actions' })
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', 'gD', '<Cmd>Pick lsp scope="declaration"<CR>', { desc = 'Declaration (LSP)' })
map('n', 'gd', '<Cmd>Pick lsp scope="definition"<CR>', { desc = 'Definition (LSP)' })
map('n', 'gi', '<Cmd>Pick lsp scope="implementation"<CR>', { desc = 'Implementation (LSP)' })
map('n', 'gl', '<Cmd>Pick lsp scope="type_definition"<CR>', { desc = 'Type definition (LSP)' })
map('n', 'gr', '<Cmd>Pick lsp scope="references"<CR>', { desc = 'References (LSP)' })
map('n', 'gw', '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = 'Grep word (LSP)' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Information' })

-- LSP (Leader)
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Declaration' })
map('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Definition' })
map('n', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format' })
map('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'Implementation' })
map('n', '<leader>lR', vim.lsp.buf.references, { desc = 'References' })
map('n', '<leader>rn', function() return ':IncRename ' .. vim.fn.expand('<cword>') end, { expr = true })
map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature' })
map('n', '<leader>ly', vim.lsp.buf.type_definition, { desc = 'Type Definition' })
map('v', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('x', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format' })

-- Diagnostics
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
map(
  'n',
  '[e',
  function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  { desc = 'Previous Diagnostic' }
)
map(
  'n',
  ']e',
  function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  { desc = 'Next Diagnostic' }
)

-- Git
map('n', '<leader>gg', '<Cmd>Git<CR>', { desc = 'Git' })

map('n', '<leader>gA', '<Cmd>lua require("gitsigns").stage_buffer()<CR>', { desc = 'Add buffer' })
map('n', '<leader>ga', '<Cmd>lua require("gitsigns").stage_hunk()<CR>', { desc = 'Add (stage) hunk' })
map('n', '<leader>gb', '<Cmd>lua require("gitsigns").blame_line()<CR>', { desc = 'Blame line' })
map('n', '<leader>gp', '<Cmd>lua require("gitsigns").preview_hunk()<CR>', { desc = 'Preview hunk' })
map('n', '<leader>gq', '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>', { desc = 'Quickfix hunks' })
map('n', '<leader>gu', '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', { desc = 'Undo stage hunk' })
map('n', '<leader>gX', '<Cmd>lua require("gitsigns").reset_buffer()<CR>', { desc = 'Discard buffer' })
map('n', '<leader>gx', '<Cmd>lua require("gitsigns").reset_hunk()<CR>', { desc = 'Discard hunk' })

map('n', '[h', '<Cmd>Gitsigns prev_hunk<CR>zvzz', { desc = 'Goto previous hunk' })
map('n', ']h', '<Cmd>Gitsigns next_hunk<CR>zvzz', { desc = 'Goto next hunk' })

-- Pick
map('n', ',', '<Cmd>lua MiniExtra.pickers.buf_lines()<CR>', { desc = 'Buffer lines' })
map('n', '<leader>/', '<Cmd>lua MiniPick.builtin.grep_live()<CR>', { desc = 'Grep' })
map('n', '<leader>:', '<Cmd>Pick history<CR>', { desc = 'History' })
map('n', '<leader>fD', '<Cmd>Pick diagnostic scope="all"<CR>', { desc = 'Diagnostics (Workspace)' })
map('n', '<leader>fG', utils.pick_file_changes_from_branch, { desc = 'Git changes (branch)' })
map('n', '<leader>fL', '<Cmd>Pick buf_lines scope="all"<CR>', { desc = 'Lines (all)' })
map('n', '<leader>fS', '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = 'Symbols (Workspace)' })
map('n', '<leader>fa', '<Cmd>lua MiniExtra.pickers.git_hunks()<CR>', { desc = 'Git Hunks' })
map('n', '<leader>fb', '<Cmd>lua MiniPick.builtin.buffers()<CR>', { desc = 'Buffers' })
map('n', '<leader>fd', '<Cmd>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Diagnostics' })
map('n', '<leader>fe', '<Cmd>lua MiniExtra.pickers.explorer()<CR>', { desc = 'Explorer' })
map('n', '<leader>ff', '<Cmd>lua MiniPick.builtin.files()<CR>', { desc = 'Files' })
map('n', '<leader>fg', utils.pick_modified_untracked, { desc = 'Git files' })
map('n', '<leader>fh', '<Cmd>lua MiniPick.builtin.help()<CR>', { desc = 'Help' })
map('n', '<leader>fj', '<Cmd>Pick list scope="jump"<CR>', { desc = 'Jumplist' })
map('n', '<leader>fk', '<Cmd>lua MiniExtra.pickers.keymaps()<CR>', { desc = 'Keymaps' })
map('n', '<leader>fl', '<Cmd>Pick buf_lines scope="current"<CR>', { desc = 'Lines (current)' })
map('n', '<leader>fo', '<Cmd>lua MiniExtra.pickers.oldfiles()<CR>', { desc = 'Oldfiles' })
map('n', '<leader>fr', '<Cmd>lua MiniPick.builtin.resume()<CR>', { desc = 'Resume' })
map('n', '<leader>fs', '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = 'Symbols (Buffer)' })
map('n', '<leader>ft', '<Cmd>lua MiniExtra.pickers.treesitter()<CR>', { desc = 'Treesitter' })

-- Oil
map('n', '<leader>oo', '<Cmd>Oil<CR>', { desc = 'Oil' })

-- Quickfix
map('n', '<leader>qq', utils.toggle_quickfix, { desc = 'Quickfix' })

-- Testing
map('n', '<leader>tF', '<Cmd>TestFile --coverage<CR>', { desc = 'Test: file (coverage)' })
map('n', '<leader>tL', '<Cmd>TestLast --coverage<CR>', { desc = 'Test: last (coverage)' })
map('n', '<leader>tN', '<Cmd>TestNearest --coverage<CR>', { desc = 'Test: nearest (coverage)' })
map('n', '<leader>tS', '<Cmd>TestSuite --coverage<CR>', { desc = 'Test: suite (coverage)' })
map('n', '<leader>tf', '<Cmd>TestFile<CR>', { desc = 'Test: file' })
map('n', '<leader>tl', '<Cmd>TestLast<CR>', { desc = 'Test: last' })
map('n', '<leader>tn', '<Cmd>TestNearest<CR>', { desc = 'Test: nearest' })
map('n', '<leader>ts', '<Cmd>TestSuite<CR>', { desc = 'Test: suite' })
map('n', '<leader>tv', '<Cmd>TestVisit<CR>', { desc = 'Test: visit' })
map('n', '<leader>tc', '<Cmd>Coverage<CR>', { desc = 'Test: coverage' })

-- Other
map('n', '<leader>oc', '<Cmd>colorscheme randomhue<CR>', { desc = 'Random colorscheme' })
map('n', '<leader>om', '<Cmd>Mason<CR>', { desc = 'Mason' })
map('n', '<leader>op', '<Cmd>PaqSync<CR>', { desc = 'Paq' })
