return {
  {
    'dmmulroy/tsc.nvim',
    ft = { 'typescript', 'typescriptreact' },
    config = true,
    init = function()
      vim.keymap.set('n', '<leader>to', ':TSCOpen<CR>')
      vim.keymap.set('n', '<leader>tc', ':TSCClose<CR>')
    end,
    opt = {
      auto_start_watch_mode = true,
      flags = {
        noEmit = true,
        project = function()
          return utils.find_nearest_tsconfig()
        end,
        watch = true,
      },
    },
  },
}
