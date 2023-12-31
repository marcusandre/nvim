-- Faster insertion of key/value pairs
vim.api.nvim_buf_set_keymap(0, 'i', '<M-i>', ' = ', { noremap = true })

-- Handle trainling comma when splitting inside curly brackets
local has_mini_splitjoin, mini_splitjoin = pcall(require, 'mini.splitjoin')

if has_mini_splitjoin then
  local gen_hook = mini_splitjoin.gen_hook
  local curly = { brackets = { '%b{}' } }

  local add_comma_curly = gen_hook.add_trailing_separator(curly)
  local del_comma_curly = gen_hook.del_trailing_separator(curly)
  local pad_curly = gen_hook.pad_brackets(curly)

  ---@diagnostic disable-next-line: inject-field
  vim.b.minisplitjoin_config = {
    split = { hooks_post = { add_comma_curly } },
    join = { hooks_post = { del_comma_curly, pad_curly } },
  }
end

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
