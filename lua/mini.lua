-- mini.basics
require('mini.basics').setup({
  options = {
    extra_ui = true,
  },
  mappings = {
    windows = true,
    move_with_alt = true,
  },
})

-- mini.bufremove
require('mini.bufremove').setup()

-- mini.completion
require('mini.completion').setup({
  lsp_completion = {
    source_func = 'omnifunc',
  },
})

-- mini.cursorword
require('mini.cursorword').setup()

-- mini.cursorword
require('mini.pick').setup()

-- mini.surround
require('mini.surround').setup()

-- mini.splitjoin
require('mini.splitjoin').setup()

-- mini.trailspace
require('mini.trailspace').setup()

-- mini.extra
local miniextra = require('mini.extra')

miniextra.setup()

-- mini.files
local utils = require('m.utils')

require('mini.files').setup()

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesActionRename',
  callback = function(event) utils.file_on_rename(event.data.from, event.data.to) end,
})

vim.api.nvim_create_autocmd('User', {
  desc = 'Add minifiles keymaps',
  pattern = 'MiniFilesBufferCreate',
  callback = function(event)
    local buf_id = event.data.buf_id
    vim.keymap.set('n', 'gY', utils.yank_reative_path, {
      buffer = buf_id,
    })
  end,
})

-- mini.hipatterns
local hipatterns = require('mini.hipatterns')
local hi_words = miniextra.gen_highlighter.words

hipatterns.setup({
  highlighters = {
    todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
    fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
    hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
    note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- mini.starter
require('mini.starter').setup()

-- mini.statusline
require('mini.statusline').setup()

-- mini.tabline
-- require('mini.tabline').setup()

-- mini.visits
-- require('mini.visits').setup()
