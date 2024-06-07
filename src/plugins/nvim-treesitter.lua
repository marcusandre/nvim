local ensure_installed = {
  "fish",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "hcl",
  "json",
  "json5",
  "jsonc",
  "just",
  "lua",
  "markdown",
  "markdown_inline",
  "ron",
  "rust",
  "terraform",
  "toml",
  "vimdoc",
}

local should_disable = function(_, buf)
  local max_filesize = 100 * 1024 -- 100 KB
  ---@diagnostic disable-next-line: undefined-field
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then return true end
end

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = ensure_installed,
  auto_install = true,
  highlight = {
    enable = true,
    disable = should_disable,
  },
  indent = {
    enable = true,
    align = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-.>",
      node_incremental = "<C-.>",
      scope_incremental = nil,
      node_decremental = "<C-,>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
})
