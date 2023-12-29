return {
  'echasnovski/mini.nvim',
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
    require('mini.bracketed').setup()

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

    -- mini.pairs
    require('mini.pairs').setup()

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

    -- mini.visits
    require('mini.visits').setup()
  end,
}
