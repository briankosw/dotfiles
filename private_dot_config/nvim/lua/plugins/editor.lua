return {
  {
    'dinhhuy258/git.nvim'
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
      })
    end
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'VimEnter',
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
  }
}
