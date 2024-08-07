pcall(function() vim.loader.enable() end)

_G.Config = {
  path_package = vim.fn.stdpath("data") .. "/site/",
  path_source = vim.fn.stdpath("config") .. "/src/",
  snippets_source = vim.fn.stdpath("config") .. "/misc/snippets",
  notes_source = vim.env.OBSIDIAN_VAULT_DIR,
}

-- Ensure 'mini.nvim' is set up
local mini_path = Config.path_package .. "pack/deps/start/mini.nvim"

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require("mini.deps").setup({ path = { package = Config.path_package } })

-- Define helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local source = function(path) dofile(Config.path_source .. path) end

-- Load settings and mappings
now(function() source("globals.lua") end)
now(function() source("autocmds.lua") end)
now(function() source("functions.lua") end)
now(function() source("settings.lua") end)
now(function() source("mappings.lua") end)
now(function() source("mappings-leader.lua") end)

-- Colors
now(function()
  add("folke/tokyonight.nvim")
  add("EdenEast/nightfox.nvim")
  add("ellisonleao/gruvbox.nvim")

  -- require("gruvbox").setup({
  --   contrast = "hard", -- can be "hard", "soft" or empty string
  -- })

  vim.cmd([[colorscheme tokyonight-moon]])
end)

-- Setup mini plugins (Stage 1)
now(function() require("mini.notify").setup() end)
now(function() require("mini.statusline").setup() end)
now(function() require("mini.tabline").setup() end)

-- Setup mini plugins (Stage 2)
later(function() require("mini.ai").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.bracketed").setup() end)
later(function() require("mini.bufremove").setup() end)
later(function() require("mini.cursorword").setup() end)
later(function() require("mini.extra").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.splitjoin").setup() end)
later(function() require("mini.trailspace").setup() end)
later(function() require("mini.visits").setup() end)
later(function() require("mini.icons").setup() end)

later(function()
  local ts_spec = {
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "master",
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
  }
  add({
    source = "nvim-treesitter/nvim-treesitter-textobjects",
    depends = { ts_spec },
  })
  source("plugins/nvim-treesitter.lua")
end)

-- Language server configurations
now(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "b0o/SchemaStore.nvim",
    },
  })
  source("plugins/nvim-lspconfig.lua")
end)

-- Lua/Neovim development
later(function()
  add("folke/lazydev.nvim")
  require("lazydev").setup()
end)

-- Surroundings
later(function()
  add("kylechui/nvim-surround")
  require("nvim-surround").setup()
end)

-- Formatting
later(function()
  add("stevearc/conform.nvim")
  source("plugins/conform.lua")
end)

-- Fuzzy finder and picker
later(function()
  add("ibhagwan/fzf-lua")
  require("fzf-lua").setup()
end)

-- Git hunks
now(function()
  add("lewis6991/gitsigns.nvim")
  source("plugins/gitsigns.lua")
end)

-- Completion
later(function()
  add({
    source = "hrsh7th/nvim-cmp",
    depends = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
  })
  source("plugins/nvim-cmp.lua")
end)

-- Snippets
later(function()
  add("garymjr/nvim-snippets")
  source("plugins/nvim-snippets.lua")
end)

-- File explorer
now(function()
  add({ source = "stevearc/oil.nvim" })
  require("oil").setup({
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  })
end)

-- Git clients
later(function() add("tpope/vim-fugitive") end)

-- Testing
later(function()
  add({
    source = "vim-test/vim-test",
    depends = {
      "nvim-lua/plenary.nvim",
      "tpope/vim-projectionist",
      "andythigpen/nvim-coverage",
    },
  })
  require("coverage").setup({
    signs = {
      covered = {
        text = " ▒",
      },
      uncovered = {
        text = " ▒",
      },
    },
  })
end)

-- Additional interfaces for vim.ui
later(function()
  add("stevearc/dressing.nvim")
  require("dressing").setup({
    -- select = {
    --   enabled = false,
    -- },
  })
end)

-- Find and Replace
later(function()
  add("MagicDuck/grug-far.nvim")
  require("grug-far").setup()
end)

-- TypeScript companion
later(function()
  add("yioneko/nvim-vtsls")
  source("plugins/nvim-vtsls.lua")
end)

-- Obsidian notes
if Config.notes_source then
  later(function()
    add({ source = "epwalsh/obsidian.nvim", depends = { "nvim-lua/plenary.nvim" } })
    require("obsidian").setup({
      workspaces = {
        {
          name = "vault",
          path = Config.notes_source,
        },
      },
    })
  end)
end

-- Markdown
later(function()
  add("MeanderingProgrammer/markdown.nvim")
  require("render-markdown").setup()
end)

-- Interactive overview over keymaps
later(function()
  add("linrongbin16/gitlinker.nvim")
  require("gitlinker").setup({
    router = {
      browse = {
        ["^github"] = require("gitlinker.routers").github_browse,
      },
      blame = {
        ["^github"] = require("gitlinker.routers").github_blame,
      },
    },
  })
end)

-- Interactive overview over keymaps
later(function()
  add("folke/which-key.nvim")
  require("which-key").setup()
end)

-- Indent guides
later(function()
  add("lukas-reineke/indent-blankline.nvim")
  source("plugins/ibl.lua")
end)
