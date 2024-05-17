local M = {}

--- Keymaps
M.map = function(mode, lhs, rhs, opts)
  if lhs == "" then
    return
  end
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Toggles
M.toggle_inlay_hints = function(opts)
  opts = opts or {}
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}), opts)
end

M.toggle_theme = function()
  local current_background = vim.go.background

  if current_background == "dark" then
    vim.cmd([[colorscheme default]])
    vim.go.background = "light"
  else
    vim.cmd([[colorscheme nightfox]])
    vim.go.background = "dark"
  end
end

M.toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

-- Buffers
M.delete_all_buffers = function()
  local buf_ids = vim.api.nvim_list_bufs()

  for _, buf_id in ipairs(buf_ids) do
    M.delete_buffer(buf_id)
  end
  vim.cmd("only")
end

M.delete_other_buffers = function()
  local current_buf_id = vim.api.nvim_get_current_buf()
  local buf_ids = vim.api.nvim_list_bufs()

  for _, buf_id in ipairs(buf_ids) do
    if buf_id ~= current_buf_id then
      M.delete_buffer(buf_id)
    end
  end
  vim.cmd("only")
end

-- Telescope
M.find_changed_files = function(opts)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local sorters = require("telescope.sorters")

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "Git Diff (origin/main)",
      finder = finders.new_oneshot_job({
        "git",
        "diff",
        "origin/main",
        "--name-only",
      }, opts),
      sorter = sorters.get_generic_fuzzy_sorter(),
    })
    :find()
end

M.git_co_authors = function(opts)
  local make_entry = require("telescope.make_entry")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local sorters = require("telescope.sorters")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local command = { "git", "log", "--pretty=%aN <%aE>" }

  local seen = {}
  local string_entry_maker = make_entry.gen_from_string()
  opts = opts or {}
  opts.entry_maker = function(string)
    if not seen[string] then
      seen[string] = true
      return string_entry_maker(string)
    else
      return nil
    end
  end

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "Git Co-Authors",
      finder = finders.new_oneshot_job(command, opts),
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(bufnr, map)
        local insert = function()
          local picker = action_state.get_current_picker(bufnr)
          local selections = picker:get_multi_selection()
          if next(selections) == nil then
            selections = { picker:get_selection() }
          end
          actions.close(bufnr)

          local coauthors = { "", "" }
          for _, c in ipairs(selections) do
            table.insert(coauthors, "Co-authored-by: " .. c[1])
          end
          vim.api.nvim_put(coauthors, "l", true, false)
        end

        map("i", "<CR>", insert)
        map("n", "<CR>", insert)

        return true
      end,
    })
    :find()
end

return M
