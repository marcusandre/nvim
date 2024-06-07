local map = Config.map

require("snippets").setup({
  create_cmp_source = true,
  search_paths = { Config.snippets_source },
})

map("i", "<C-k", function()
  if vim.snippet.active({ direction = 1 }) then
    vim.schedule(function() vim.snippet.jump(1) end)
    return
  end
  return "<C-k>"
end, { expr = true, silent = true })

map("s", "<C-k", function()
  vim.schedule(function() vim.snippet.jump(1) end)
end, { expr = true, silent = true })

map({ "i", "s" }, "<C-j", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.schedule(function() vim.snippet.jump(-1) end)
    return
  end
  return "<C-j>"
end, { expr = true, silent = true })
