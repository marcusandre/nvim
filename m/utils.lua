local M = {}

--- Paq

M.clone_paq = function()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0
  if not is_installed then
    vim.fn.system({ 'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', path })
    return true
  end
end

M.bootstrap_paq = function(packages)
  local first_install = M.clone_paq()
  vim.cmd.packadd('paq-nvim')
  local paq = require('paq')
  if first_install then vim.notify('Installing plugins... If prompted, hit Enter to continue.') end

  paq(packages)
  paq.install()
end

--- LSP

M.lua_servers = {
  lua_ls = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      runtime = {
        version = 'LuaJIT',
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

return M
