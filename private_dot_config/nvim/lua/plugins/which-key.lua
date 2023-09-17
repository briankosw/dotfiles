return {
  'folke/which-key.nvim',
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require('which-key').register({
      ['<leader>'] = {
        d = { '<cmd>bd<cr>', 'Close current buffer' },
        h = { '<cmd>noh<cr>', 'No highlight' },
        -- https://vimtricks.com/p/get-the-current-file-path/
        y = { '<cmd>let @*=fnamemodify(expand("%"), ":~:.")<cr>', 'Copy current buffer\'s file path' },
      },
      ['<leader>b'] = {
        name = 'Buffers',
        h = { '<cmd>BufferLineCloseLeft<CR>', 'Close all buffers to the left' },
        l = { '<cmd>BufferLineCloseRight<cr>', 'Close all buffers to the right' },
      },
      ['<leader>c'] = {
        name = 'Code',
        i = { '<cmd>TypescriptAddMissingImports<CR>', 'Add missing imports' },
      },
      ['<leader>g'] = {
        name = 'Git',
        o = { '<cmd>lua require("git.browse").open()<CR>', 'Open file in git repository' },
        O = { '<cmd>Telescope git_status<cr>', 'Open changed files' },
      },
      ['<leader>l'] = {
        j = { vim.diagnostic.goto_next, 'Go to next diagnostics' },
        k = { vim.diagnostic.goto_prev, 'Go to prev diagnostics' },
        r = { vim.lsp.buf.rename, 'Rename variable' },
      },
    })
  end
}
