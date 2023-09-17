vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { noremap = false, silent = true })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { noremap = false, silent = true })
vim.keymap.set('n', 'gvd', ':vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'ghd', ':sp<CR><cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

function _G.get_visual_selection()
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))
  if start_row ~= end_row then
    return ""
  end
  local line = vim.api.nvim_buf_get_lines(0, start_row-1, start_row, false)[1]
  return line:sub(start_col, end_col)
end

-- Function to open a URL
function _G.open_prod_url()
  local selection = get_visual_selection()
  local url = "https://go/q/" .. selection
  vim.fn.jobstart({"open", url})
end

-- Function to open a URL
function _G.open_dev_url()
  local selection = get_visual_selection()
  local url = "https://go/dq/" .. selection
  vim.fn.jobstart({"open", url})
end

-- Map visual mode command to open url
vim.api.nvim_set_keymap('v', '<leader>qq', '<cmd>lua open_prod_url()<CR>', {noremap = true,silent=true})
vim.api.nvim_set_keymap('v', '<leader>dq', '<cmd>lua open_dev_url()<CR>', {noremap = true,silent=true})
