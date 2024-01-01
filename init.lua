vim.loader.enable()

-- Set <Space> as the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core
require('m.lazy')
require('m.globals')
require('m.options')
require('m.keymaps')
