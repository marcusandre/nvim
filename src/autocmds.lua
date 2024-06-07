local set = vim.opt_local

local function augroup(name) return vim.api.nvim_create_augroup("m_" .. name, { clear = true }) end

-- Enable inlay hints by default for `rust`
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   callback = function(event)
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--     if client and client.supports_method("textDocument/inlayHint") then vim.lsp.inlay_hint.enable() end
--   end,
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank() end,
})

-- Jump to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- Quit fugitive buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "fugitiveblame", "fugitive" },
  callback = function()
    _G.Config.map("n", "q", "<Cmd>quit<CR>", {
      buffer = 0,
    })
  end,
})

-- Wrap and check for spelling mistakes in text files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Set options for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("term_open"),
  callback = function()
    vim.bo.filetype = "terminal"

    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})

-- Display diagnostics as virtual text only if not in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
})
