-- Disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.number = true

opt.termguicolors = true

opt.splitright = true
opt.splitbelow = true

vim.opt.wrap = false

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
