local utils = require('m.utils')
local map = vim.keymap.set

-- General
map('n', 'Q', '<nop>')
map('n', 'n', 'nzz')
map('n', '<leader><leader>', '<Cmd>:b#<CR>', { desc = 'Alternate Buffer' })
map('n', '<Esc>', '<Cmd>nohl<CR><Esc>', { desc = 'Remove highlights' })
map('i', 'kj', '<Esc>', { desc = 'Leave input mode' })

-- Completion
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Buffers
map('n', '<leader>bd', utils.delete_buffer, { desc = 'Delete' })
map('n', '<leader>bD', function() utils.delete_buffer(0, true) end, { desc = 'Delete!' })
map('n', '<leader>bq', utils.delete_other_buffers, { desc = 'Delete Others' })
map('n', '<leader>bQ', utils.delete_all_buffers, { desc = 'Delete All' })
map('n', '<leader>bs', utils.make_scratch_buffer, { desc = 'Scratch' })
map('n', '<leader>bw', utils.wipeout_buffer, { desc = 'Wipeout' })
map('n', '<leader>bW', function() utils.wipeout_buffer(0, true) end, { desc = 'Wipeout!' })

-- LSP
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Actions' })
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Information' })

-- LSP (Leader)
-- stylua: ignore start
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Declaration' })
map('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Definition' })
map('n', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format' })
map('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'Implementation' })
map('n', '<leader>lR', vim.lsp.buf.references, { desc = 'References' })
map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature' })
map('n', '<leader>lv', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', { desc = 'Definition (vertical)' })
map('n', '<leader>ly', vim.lsp.buf.type_definition, { desc = 'Type Definition' })
map('v', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('x', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format' })
-- stylua: ignore end

-- Diagnostics
-- stylua: ignore start
map('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Previous Diagnostic' })
map('n', ']e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Next Diagnostic' })
-- stylua: ignore end

-- Quickfix
map('n', '<leader>qq', utils.toggle_quickfix, { desc = 'Quickfix' })

-- Other
map('n', '<leader>oc', '<Cmd>colorscheme randomhue<CR>', { desc = 'Random colorscheme' })
map('n', '<leader>ot', '<Cmd>colorscheme tokyonight-moon<CR>', { desc = 'Tokyonight Moon' })
map('n', '<leader>om', '<Cmd>Mason<CR>', { desc = 'Mason' })
map('n', '<leader>ol', '<Cmd>Lazy<CR>', { desc = 'Lazy' })
