local M = {}

local is_inside_work_tree = {}

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
M.file_on_rename = function(from, to)
  local ok, clients = pcall(vim.lsp.get_active_clients)
  if not ok or type(clients) ~= 'table' then return end

  for _, client in ipairs(clients) do
    local resp = client.request_sync('workspace/willRenameFiles', {
      files = {
        {
          oldUri = vim.uri_from_fname(from),
          newUri = vim.uri_from_fname(to),
        },
      },
    }, 1000, 0)
    if resp and resp.result ~= nil then vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding) end
  end
end

--- Quickfix
M.toggle_quickfix = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then qf_exists = true end
  end
  if qf_exists == true then
    vim.cmd('cclose')
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then vim.cmd('copen') end
end

--- Mini.Files
M.minifiles_toggle = function(...)
  local MiniFiles = require('mini.files')
  if not MiniFiles.close() then MiniFiles.open(...) end
end

M.yank_reative_path = function()
  local MiniFiles = require('mini.files')
  local path_entry = MiniFiles.get_fs_entry().path
  local path = vim.fn.fnamemodify(path_entry, ':.')

  vim.fn.setreg('+', path)
  print(path)
end

--- Mini.Pick
M.pick_modified_untracked = function()
  local MiniPick = require('mini.pick')
  local local_opts = { command = { 'git', 'ls-files', '--modified', '--others', '--exclude-standard' } }
  local source = {
    name = 'Git files (modified + untracked)',
    show = function(buf_id, items, query) return MiniPick.default_show(buf_id, items, query, { show_icons = true }) end,
  }
  return MiniPick.builtin.cli(local_opts, { source = source })
end

M.pick_file_changes_from_branch = function()
  local cwd = vim.fn.getcwd()
  local MiniPick = require('mini.pick')

  if is_inside_work_tree[cwd] == nil then
    vim.fn.system('git rev-parse --is-inside-work-tree')
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    local main_branch = vim.fn.trim(vim.fn.system("sed -e 's/^.*\\///' < .git/refs/remotes/origin/HEAD"))
    local local_opts = {
      command = { 'git', 'diff', 'origin/' .. main_branch, '--name-only' },
    }
    local source = {
      name = 'Git changes (branch)',
      show = function(buf_id, items, query) return MiniPick.default_show(buf_id, items, query, { show_icons = true }) end,
    }

    MiniPick.builtin.cli(local_opts, { source = source })
  end
end

return M
