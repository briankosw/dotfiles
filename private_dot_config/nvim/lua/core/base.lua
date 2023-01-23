-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.g.material_theme_style = "ocean"
vim.cmd [[ colorscheme material ]]

vim.g.mapleader = " "

vim.opt.number = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- https://github.com/lukas-reineke/indent-blankline.nvim
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { noremap = false, silent = true })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { noremap = false, silent = true })
vim.keymap.set('n', 'gvd', ':vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'ghd', ':sp<CR><cmd>lua vim.lsp.buf.definition()<CR>')
