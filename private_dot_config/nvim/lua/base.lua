-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.g.material_theme_style = "ocean"
vim.cmd [[ colorscheme material ]]

vim.g.mapleader = " "

vim.opt.number = true

-- https://github.com/lukas-reineke/indent-blankline.nvim
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
