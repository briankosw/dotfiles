return {
  {
    'aserowy/tmux.nvim',
    config = function() require('tmux').setup()
    end
  },
  {
    'dinhhuy258/git.nvim',
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = vim.o.columns * 0.4,
	direction = 'vertical',
	open_mapping = [[<c-\>]],
      })
    end
  },
}
