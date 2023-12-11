-- folke/tokyonight
require('tokyonight').setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
  },
})

-- Colors
vim.cmd.colorscheme('tokyonight')

-- folke/which-key
require('which-key').setup()

-- lukas-reineke/indent-blankline.nvim
require('ibl').setup({
  scope = {
    show_start = false,
    show_end = false,
  },
})
