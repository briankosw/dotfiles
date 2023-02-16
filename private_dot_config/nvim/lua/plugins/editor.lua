return {
  {
    'windwp/nvim-autopairs',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = vim.o.columns * 0.5,
	      direction = 'vertical',
	      open_mapping = [[<c-\>]],
      })
    end
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'VimEnter',
    dependencies = {
      'github/copilot.vim'
    },
    config = function()
      vim.defer_fn(function()
	      require('copilot').setup({
	        panel = {
	          enabled = false,
	          auto_refresh = false,
	        },
	        suggestion = {
	          enabled = true,
	          auto_trigger = true,
	          debounce = 75,
	          keymap = {
	            accept = '<C-space>',
	            accept_word = false,
	            accept_line = false,
	          },
	        }
	      })
      end, 100)
    end
  },
  {
    'aserowy/tmux.nvim',
    config = function() require('tmux').setup()
    end
  },
  {
    'dinhhuy258/git.nvim',
  },
}
