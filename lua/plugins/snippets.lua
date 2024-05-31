return {
  "garymjr/nvim-snippets",
  lazy = false,
  opts = {
    create_cmp_source = true,
    search_paths = {
      vim.fn.stdpath("config") .. "/lua/m/snippets",
    },
  },
  keys = {
    {
      "<C-k>",
      function()
        if vim.snippet.active({ direction = 1 }) then
          vim.schedule(function() vim.snippet.jump(1) end)
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
        vim.schedule(function() vim.snippet.jump(1) end)
      end,
      expr = true,
      silent = true,
      mode = "s",
    },
    {
      "<C-j>",
      function()
        if vim.snippet.active({ direction = -1 }) then
          vim.schedule(function() vim.snippet.jump(-1) end)
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
