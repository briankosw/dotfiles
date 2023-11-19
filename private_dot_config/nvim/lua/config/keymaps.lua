vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { noremap = false, silent = true })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { noremap = false, silent = true })
vim.keymap.set("n", "gvd", ":vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "ghd", ":sp<CR><cmd>lua vim.lsp.buf.definition()<CR>")
