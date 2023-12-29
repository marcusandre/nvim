-- folke/tokyonight
require('tokyonight').setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
  },
})

-- Colors
vim.cmd.colorscheme('tokyonight-night')

-- folke/which-key
require('which-key').setup()

-- lukas-reineke/indent-blankline.nvim
-- require('ibl').setup({
--   indent = {
--     char = '▏',
--   },
--   scope = {
--     show_start = false,
--     show_end = false,
--   },
-- })

-- ~whynothugo/lsp_lines.nvim
require('lsp_lines').setup()

vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
