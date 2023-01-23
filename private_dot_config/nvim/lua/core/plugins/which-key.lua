return {
  'folke/which-key.nvim',
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require('which-key').register({
      g = {
        d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'Go to definition' },
        r = { '<cmd>lua require("telescope.builtin").lsp_references()<cr>', 'Go to references' },
        s = { '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', 'Go to symbols' },
      },
      ['<leader>'] = {
        c = { '<cmd>BufferKill<cr>', 'Close current buffer' },
        h = { '<cmd>noh<cr>', 'No highlight' },
        [';'] = { '<cmd>dashboard<cr>', 'Open dashboard' },
      },
      ['<leader>b'] = {
	name = 'Buffers',
        h = { '<cmd>BufferLineCloseLeft<CR>', 'Close all buffers to the left' },
        l = { '<cmd>BufferLineCloseRight<cr>', 'Close all buffers to the right' },
      },
      ['<leader>g'] = {
	name = 'Git',
        o = { '<cmd>lua require("git.browse").open()<CR>', 'Open file in git repository' },
        O = { '<cmd>Telescope git_status<cr>', 'Open changed files' },
      },
      ['<leader>l'] = {
        r = { vim.lsp.buf.rename, 'Rename variable' },
      },
    })
  end
}
