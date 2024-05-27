return {
  "garymjr/nvim-snippets",
  -- dependencies = { "rafamadriz/friendly-snippets" },
  lazy = false,
  opts = {
    -- create_autocmd = true,
    create_cmp_source = true,
    -- friendly_snippets = true,
    search_paths = {
      vim.fn.stdpath("config") .. "/lua/m/snippets",
    },
  },
  keys = {
    {
      "<C-k>",
      function()
        if vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
          return
        end
        return "<C-k>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<C-k>",
      function()
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      end,
      expr = true,
      silent = true,
      mode = "s",
    },
    {
      "<C-j>",
      function()
        if vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
          return
        end
        return "<C-j>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
  },
}
