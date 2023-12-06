-- https://github.com/neovim/neovim/pull/22668
if vim.fn.has('nvim-0.9') == 1 then vim.loader.enable() end

require('m.globals')
require('m.settings')
require('m.keymaps')
require('m.lazy')
