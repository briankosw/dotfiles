return {
  -- Colorscheme
  {
    'kaicataldo/material.vim',
  },
  { 'lukas-reineke/indent-blankline.nvim', config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('bufferline').setup()
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/which-key.nvim',
    },
    config = function()
      local tree = require('nvim-tree')
      local api = require('nvim-tree.api')
      tree.setup({
        on_attach = function(bufnr)
          vim.keymap.set('n', 'l', function()
            api.node.open.edit()
          end,
            { buffer = bufnr, noremap = true, silent = true, nowait = true,
              desc = 'open a file or folder; root will cd to the above directory' })
          vim.keymap.set('n', 'h', function()
            api.node.navigate.parent_close()
          end,
            { buffer = bufnr, noremap = true, silent = true, nowait = true,
              desc = 'close current open directory or parent' })
        end
      })
      require('which-key').register({
        ['<leader>'] = {
          e = { '<cmd>NvimTreeToggle<cr>', 'Open file tree' },
        },
      })
    end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local dashboard = require('dashboard')
      dashboard.custom_header = {
        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
      }
      dashboard.custom_center = {
        {
	  icon = '  ',
          desc = 'Find file                               ',
          action = 'Telescope find_files',
          shortcut = 'SPC f'
	},
        {
	  icon = '  ',
          desc = 'Find text                             ',
          action = 'Telescope live_grep',
          shortcut = 'SPC s t'
  	},
      }
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup()
      vim.notify = require('notify')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    config = function()
      require('todo-comments').setup()
    end
  },
}
