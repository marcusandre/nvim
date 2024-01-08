local utils = require('m.utils')

return {
  'echasnovski/mini.nvim',
  lazy = false,
  keys = {
    -- stylua: ignore start
    { '<leader>z,', '<Cmd>lua MiniExtra.pickers.buf_lines()<CR>',  { desc = 'Buffer lines' } },
    { '<leader>z/', '<Cmd>lua MiniPick.builtin.grep_live()<CR>',   { desc = 'Grep' } },
    { '<leader>z:', '<Cmd>Pick history<CR>',                       { desc = 'History' } },
    { '<leader>zD', '<Cmd>Pick diagnostic scope="all"<CR>',        { desc = 'Diagnostics (Workspace)' } },
    { '<leader>zG', utils.pick_file_changes_from_branch,           { desc = 'Git changes (branch)' } },
    { '<leader>zL', '<Cmd>Pick buf_lines scope="all"<CR>',         { desc = 'Lines (all)' } },
    { '<leader>zS', '<Cmd>Pick lsp scope="workspace_symbol"<CR>',  { desc = 'Symbols (Workspace)' } },
    { '<leader>za', '<Cmd>lua MiniExtra.pickers.git_hunks()<CR>',  { desc = 'Git Hunks' } },
    { '<leader>zb', '<Cmd>lua MiniPick.builtin.buffers()<CR>',     { desc = 'Buffers' } },
    { '<leader>zd', '<Cmd>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Diagnostics' } },
    { '<leader>ze', '<Cmd>lua MiniExtra.pickers.explorer()<CR>',   { desc = 'Explorer' } },
    { '<leader>zf', '<Cmd>lua MiniPick.builtin.files()<CR>',       { desc = 'Files' } },
    { '<leader>zg', utils.pick_modified_untracked,                 { desc = 'Git files' } },
    { '<leader>zh', '<Cmd>lua MiniPick.builtin.help()<CR>',        { desc = 'Help' } },
    { '<leader>zj', '<Cmd>Pick list scope="jump"<CR>',             { desc = 'Jumplist' } },
    { '<leader>zk', '<Cmd>lua MiniExtra.pickers.keymaps()<CR>',    { desc = 'Keymaps' } },
    { '<leader>zl', '<Cmd>Pick buf_lines scope="current"<CR>',     { desc = 'Lines (current)' } },
    { '<leader>zo', '<Cmd>lua MiniExtra.pickers.oldfiles()<CR>',   { desc = 'Oldfiles' } },
    { '<leader>zr', '<Cmd>lua MiniPick.builtin.resume()<CR>',      { desc = 'Resume' } },
    { '<leader>zs', '<Cmd>Pick lsp scope="document_symbol"<CR>',   { desc = 'Symbols (Buffer)' } },
    { '<leader>zt', '<Cmd>lua MiniExtra.pickers.treesitter()<CR>', { desc = 'Treesitter' } },
    -- stylua: ignore end
  },
  config = function()
    -- mini.extra
    local miniextra = require('mini.extra')

    miniextra.setup()

    -- mini.ai
    local ai = require('mini.ai')
    ai.setup({
      custom_textobjects = {
        F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
      },
    })

    -- mini.align
    require('mini.align').setup()

    -- mini.basics
    require('mini.basics').setup({
      options = {
        extra_ui = true,
      },
      mappings = {
        basics = true,
        windows = true,
      },
      autocommands = {
        basic = true,
      },
    })

    -- mini.bracketed
    require('mini.bracketed').setup({
      diagnostic = { suffix = '' },
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

    -- mini.misc
    require('mini.misc').setup()

    -- mini.move
    require('mini.move').setup({
      options = {
        reindent_linewise = false,
      },
    })

    -- mini.notify
    require('mini.notify').setup()

    -- mini.pick
    local pick = require('mini.pick')

    pick.setup()

    vim.ui.select = pick.ui_select

    -- mini.surround
    require('mini.surround').setup()

    -- mini.splitjoin
    require('mini.splitjoin').setup()

    -- mini.trailspace
    require('mini.trailspace').setup()

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
    local MiniStarter = require('mini.starter')

    local header = function()
      local hour = tonumber(vim.fn.strftime('%H'))
      local part_id = math.floor((hour + 4) / 8) + 1
      local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]

      return ('Good %s!'):format(day_part)
    end

    MiniStarter.setup({
      silent = true,
      items = {
        MiniStarter.sections.builtin_actions(),
        MiniStarter.sections.recent_files(5, true, false),
        MiniStarter.sections.recent_files(5, false, false),
      },
      header = header,
    })

    -- mini.statusline
    require('mini.statusline').setup()

    -- mini.tabline
    require('mini.tabline').setup()
  end,
}
