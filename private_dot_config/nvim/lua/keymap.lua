vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Stop highlighting matches.
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<cr>', { desc = 'Stop higlighting matches' })

-- Copy current buffer's file path.
vim.keymap.set(
  'n',
  '<leader>y',
  "<cmd>let @*=fnamemodify(expand('%'), ':~:.')<cr>",
  { desc = "Copy current buffer's file path" }
)

vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close current buffer' })

vim.keymap.set(
  'n',
  'gvd',
  ':vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>',
  { desc = 'Go to definition in vertical split' }
)
vim.keymap.set(
  'n',
  'ghd',
  ':sp<CR><cmd>lua vim.lsp.buf.definition()<CR>',
  { desc = 'Go to definition in horizontal split' }
)
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Show hover information' })

vim.keymap.set('n', '<leader>lj', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>lk', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', { desc = 'Go to previous diagnostic' })
