return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme tokyonight-night]]) end,
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme nightfox]]) end,
  },
}
