local utils = require('m.utils')

local nmap = function(lhs, rhs, desc) vim.keymap.set('n', lhs, rhs, { desc = desc }) end
local vmap = function(lhs, rhs, desc) vim.keymap.set('v', lhs, rhs, { desc = desc }) end
local xmap = function(lhs, rhs, desc) vim.keymap.set('x', lhs, rhs, { desc = desc }) end

-- Basics
nmap('<esc>', '<cmd>noh<cr><esc>', 'Escape and clear hlsearch')
nmap('J', 'mzJ`z')
nmap('Q', '<nop>')
nmap('n', 'nzz')

-- Completions
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Buffers
nmap('<leader>ba', '<Cmd>b#<CR>', 'Alternate')
nmap('<leader>bd', utils.delete_buffer, 'Delete')
nmap('<leader>bD', function() utils.delete_buffer(0, true) end, 'Delete!')
nmap('<leader>bq', utils.delete_other_buffers, 'Delete Others')
nmap('<leader>bQ', utils.delete_all_buffers, 'Delete All')
nmap('<leader>bs', utils.make_scratch_buffer, 'Scratch')
nmap('<leader>bw', utils.wipeout_buffer, 'Wipeout')
nmap('<leader>bW', function() utils.wipeout_buffer(0, true) end, 'Wipeout!')

-- Git
nmap('<leader>gA', '<Cmd>lua require("gitsigns").stage_buffer()<CR>', 'Add buffer')
nmap('<leader>gX', '<Cmd>lua require("gitsigns").reset_buffer()<CR>', 'Discard (reset) buffer')
nmap('<leader>ga', '<Cmd>lua require("gitsigns").stage_hunk()<CR>', 'Add (stage) hunk')
nmap('<leader>gb', '<Cmd>lua require("gitsigns").blame_line()<CR>', 'Blame line')
nmap('<leader>gg', '<Cmd>Git<CR>', 'Open fugitive')
nmap('<leader>gp', '<Cmd>lua require("gitsigns").preview_hunk()<CR>', 'Preview hunk')
nmap('<leader>gq', '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>', 'Quickfix hunks')
nmap('<leader>gu', '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', 'Undo stage hunk')
nmap('<leader>gx', '<Cmd>lua require("gitsigns").reset_hunk()<CR>', 'Discard (reset) hunk')
nmap('[h', '<Cmd>Gitsigns prev_hunk<CR>zvzz', 'Goto previous hunk')
nmap(']h', '<Cmd>Gitsigns next_hunk<CR>zvzz', 'Goto next hunk')

-- Pick
nmap(',', '<Cmd>Pick buf_lines scope="current"<CR>', 'Lines')
nmap('<leader>/', '<Cmd>Pick grep_live<CR>', 'Live Grep')
nmap('<leader>:', '<Cmd>Pick history<CR>', 'History')
nmap('<leader>fa', '<Cmd>Pick git_hunks<CR>', 'Hunks (current)')
nmap('<leader>fb', '<Cmd>Pick buffers include_current=true<CR>', 'Buffers')
nmap('<leader>fD', '<Cmd>Pick diagnostic scope="all"<CR>', 'Diagnostics (Workspace)')
nmap('<leader>fd', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostics (Buffer)')
nmap('<leader>ff', '<Cmd>Pick files<CR>', 'Files')
nmap('<leader>fg', utils.pick_modified_untracked, 'Git files')
nmap('<leader>fG', utils.pick_file_changes_from_branch, 'Git changes (branch)')
nmap('<leader>fh', '<Cmd>Pick help<CR>', 'Help tags')
nmap('<leader>fj', '<Cmd>Pick list scope="jump"<CR>', 'Jumplist')
nmap('<leader>fL', '<Cmd>Pick buf_lines scope="all"<CR>', 'Lines (all)')
nmap('<leader>fl', '<Cmd>Pick buf_lines scope="current"<CR>', 'Lines (current)')
nmap('<leader>fo', '<Cmd>Pick oldfiles<CR>', 'Old Files')
nmap('<leader>fr', '<Cmd>Pick resume<CR>', 'Resume')
nmap('<leader>fs', '<Cmd>Pick lsp scope="document_symbol"<CR>', 'Symbols (Buffer)')
nmap('<leader>fS', '<Cmd>Pick lsp scope="workspace_symbol"<CR>', 'Symbols (Workspace)')
nmap('<leader>ft', '<Cmd>Pick treesitter<CR>', 'Treesitter')

-- LSP
nmap('gD', '<Cmd>Pick lsp scope="declaration"<CR>', 'Declaration (LSP)')
nmap('gd', '<Cmd>Pick lsp scope="definition"<CR>', 'Definition (LSP)')
nmap('gi', '<Cmd>Pick lsp scope="implementation"<CR>', 'Implementation (LSP)')
nmap('gl', '<Cmd>Pick lsp scope="type_definition"<CR>', 'Type definition (LSP)')
nmap('gr', '<Cmd>Pick lsp scope="references"<CR>', 'References (LSP)')
nmap('gw', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep word (LSP)')
nmap('K', vim.lsp.buf.hover, 'Information')

nmap('[e', function() vim.lsp.buf.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, 'Information')
nmap(']e', function() vim.lsp.buf.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, 'Information')

-- LSP (Leader)
nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
nmap('<leader>lD', vim.lsp.buf.declaration, 'Declaration')
nmap('<leader>ld', vim.lsp.buf.definition, 'Definition')
nmap('<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format')
nmap('<leader>li', vim.lsp.buf.implementation, 'Implementation')
nmap('<leader>lR', vim.lsp.buf.references, 'References')
nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
nmap('<leader>ls', vim.lsp.buf.signature_help, 'Signature')
nmap('<leader>ly', vim.lsp.buf.type_definition, 'Type Definition')
vmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
xmap('<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format')

-- Testing
nmap('<leader>tF', '<Cmd>TestFile --coverage<CR>', 'Test: file (coverage)')
nmap('<leader>tL', '<Cmd>TestLast --coverage<CR>', 'Test: last (coverage)')
nmap('<leader>tN', '<Cmd>TestNearest --coverage<CR>', 'Test: nearest (coverage)')
nmap('<leader>tS', '<Cmd>TestSuite --coverage<CR>', 'Test: suite (coverage)')
nmap('<leader>tf', '<Cmd>TestFile<CR>', 'Test: file')
nmap('<leader>tl', '<Cmd>TestLast<CR>', 'Test: last')
nmap('<leader>tn', '<Cmd>TestNearest<CR>', 'Test: nearest')
nmap('<leader>ts', '<Cmd>TestSuite<CR>', 'Test: suite')
nmap('<leader>tv', '<Cmd>TestVisit<CR>', 'Test: visit')
nmap('<leader>tc', '<Cmd>Coverage<CR>', 'Test: coverage')

-- Visits
nmap('<leader>vo', '<Cmd>lua MiniVisits.select_path(nil, { filter="core" })<CR>', 'Select "core" (cwd)')
nmap('<leader>vO', '<Cmd>lua MiniVisits.select_path("", { filter="core" })<CR>', 'Select "core" (all)')
nmap('<leader>vv', '<Cmd>lua MiniVisits.add_label("core")<CR>', 'Add "core" label')
nmap('<leader>vV', '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'Remove "core" label')

-- Explore
nmap('<leader>ee', utils.minifiles_toggle, 'MiniFiles')
nmap('<leader>ef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>', 'MiniFiles (File)')
nmap('<leader>en', "<Cmd>lua MiniFiles.open('~/.config/nvim')<CR>", 'Neovim Config')
nmap('<leader>eq', utils.toggle_quickfix, 'Quickfix: Toggle')
nmap('<leader>eu', '<CMD>UndotreeToggle<CR>', 'Open Undotree')

-- Other
nmap('<leader>ok', '<Cmd>lua MiniExtra.pickers.keymaps()<CR>', 'Keymaps')
nmap('<leader>ol', '<Cmd>Lazy<CR>', 'Lazy')
nmap('<leader>om', '<Cmd>Mason<CR>', 'Mason')
nmap('<leader>oo', '<Cmd>only<CR>', 'Window: Only')
