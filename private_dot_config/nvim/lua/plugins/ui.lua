return {
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function ()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
      }
      dashboard.section.buttons.val = {
        dashboard.button( 'f', '  Find files' , '<cmd>Telescope find_files<CR>'),
        dashboard.button( 't', '  Find text' , '<cmd>Telescope live_grep<CR>'),
        dashboard.button( 'q', '  Quit NVIM' , '<cmd>qa<CR>'),
      }
      alpha.setup(dashboard.opts)
      vim.cmd( [[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      vim.cmd.colorscheme 'catppuccin'
      require('catppuccin').setup({
	      flavour = 'macchiato',
      })
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'folke/which-key.nvim' },
    },
    config = function()
      local tree = require('nvim-tree')
      local api = require('nvim-tree.api')
      tree.setup({
        view = {
          width = 60,
        },
        update_focused_file = {
          enable = true,
        },
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
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('bufferline').setup()
    end
  },
  { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true,
      })
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
