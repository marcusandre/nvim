Config.map = function(mode, keys, cmd, opts)
  opts = opts or {}
  if opts.silent == nil then opts.silent = true end
  vim.keymap.set(mode, keys, cmd, opts)
end

Config.nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Config.map("n", "<Leader>" .. suffix, rhs, opts)
end

Config.vmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Config.map("v", "<Leader>" .. suffix, rhs, opts)
end

Config.xmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  Config.map("x", "<Leader>" .. suffix, rhs, opts)
end

Config.toggle_inlay_hints = function(opts)
  opts = opts or { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(opts), opts)
end

Config.toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then qf_exists = true end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then vim.cmd("copen") end
end
