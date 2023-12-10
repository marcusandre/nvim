require('tokyonight').setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
  },
})

vim.cmd.colorscheme('randomhue')

require('which-key').setup()

require('ibl').setup({
  scope = {
    show_start = false,
    show_end = false,
  },
})
