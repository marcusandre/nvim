return {
  {
    "vim-test/vim-test",
    keys = {
      -- stylua: ignore start
      { '<leader>tc', '<Cmd>Coverage<CR>',                desc = 'Test: coverage' },
      { '<leader>tF', '<Cmd>TestFile --coverage <CR>',    desc = 'Test: file (coverage)' },
      { '<leader>tf', '<Cmd>TestFile <CR>',               desc = 'Test: file' },
      { '<leader>tL', '<Cmd>TestLast --coverage <CR>',    desc = 'Test: last (coverage)' },
      { '<leader>tl', '<Cmd>TestLast <CR>',               desc = 'Test: last' },
      { '<leader>tN', '<Cmd>TestNearest --coverage <CR>', desc = 'Test: nearest (coverage)' },
      { '<leader>tn', '<Cmd>TestNearest <CR>',            desc = 'Test: nearest' },
      { '<leader>tS', '<Cmd>TestSuite --coverage <CR>',   desc = 'Test: suite (coverage)' },
      { '<leader>ts', '<Cmd>TestSuite <CR>',              desc = 'Test: suite' },
      { '<leader>tv', '<Cmd>TestVisit<CR>',               desc = 'Test: visit' },
      -- stylua: ignore end
    },
    opts = {},
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("coverage").setup({
        signs = {
          covered = {
            text = " ▒",
          },
          uncovered = {
            text = " ▒",
          },
        },
      })
    end,
  },
  { "tpope/vim-projectionist" },
}
