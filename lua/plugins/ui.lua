return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
        },
      })

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    main = 'ibl',
    config = function()
      require('lsp_lines').setup()

      vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup({
        enabled = false,
        scope = {
          enabled = false,
        },
        indent = {
          char = '▏',
        },
      })
    end,
  },
}
