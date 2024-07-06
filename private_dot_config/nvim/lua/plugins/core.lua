return {
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    version = '*',
    config = true,
    init = function()
      vim.keymap.set(
        'n',
        '<S-l>',
        '<cmd>BufferLineCycleNext<cr>',
        { noremap = false, silent = true, desc = 'Go to next buffer' }
      )
      vim.keymap.set(
        'n',
        '<S-h>',
        '<cmd>BufferLineCyclePrev<cr>',
        { noremap = false, silent = true, desc = 'Go to previous buffer' }
      )
      vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close all buffers to the left' })
      vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close all buffers to the right' })
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },
  -- TODO: configure
  {
    'dinhhuy258/git.nvim',
    config = true,
    init = function()
      -- TODO: Update this to open file in main
      vim.keymap.set('n', '<leader>go', '<cmd>lua require("git.browse").open()<cr>', { desc = 'Open file in GitHub' })
    end,
  },
  -- TODO: configure
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end,
  },
  -- TODO: configure
  {
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
  -- TODO: configure
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  -- TODO: configure
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = true,
  },
  -- TODO: configure
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
    init = function()
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
      vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus file explorer' })
    end,
  },
  -- TODO: configure
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          layout_config = {
            horizontal = {
              height = 0.9,
              width = 0.9,
            },
          },
          mappings = {
            i = {
              -- Close window when pressing escape in insert mode.
              ['<esc>'] = actions.close,
            },
          },
        },
      })
    end,
    init = function()
      vim.keymap.set(
        'n',
        '<leader><space>',
        '<cmd>lua require("telescope.builtin").find_files()<cr>',
        { desc = 'Find files ' }
      )
      vim.keymap.set(
        'n',
        '<leader>sd',
        '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>',
        { desc = 'Go to definitions' }
      )
      vim.keymap.set(
        'n',
        '<leader>sg',
        '<cmd>lua require("telescope.builtin").live_grep()<cr>',
        { desc = 'Search text' }
      )
      vim.keymap.set(
        'n',
        '<leader>sr',
        '<cmd>lua require("telescope.builtin").lsp_references()<cr>',
        { desc = 'Go to references' }
      )
      vim.keymap.set(
        'n',
        '<leader>gb',
        '<cmd>lua require("telescope.builtin").git_branches()<cr>',
        { desc = 'Search git branches' }
      )
      vim.keymap.set(
        'n',
        '<leader>gs',
        '<cmd>lua require("telescope.builtin").git_stash()<cr>',
        { desc = 'Search git stashes' }
      )
      vim.keymap.set('n', '<leader>gO', '<cmd>Telescope git_status<cr>', { desc = 'Open git status' })
    end,
  },
  -- TODO: configure
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local api = require('nvim-tree.api')
      require('nvim-tree').setup({
        on_attach = function(buffer)
          vim.keymap.set('n', 'l', function()
            api.node.open.edit()
          end, { buffer = buffer, desc = 'Open file/folder' })
          vim.keymap.set('n', 'h', function()
            api.node.navigate.parent_close()
          end, { buffer = buffer, desc = 'Close current folder' })
          vim.keymap.set('n', 'v', function()
            api.node.open.vertical()
          end, { buffer = buffer, desc = 'Open file in vertical split' })
          vim.keymap.set('n', 'd', function()
            api.fs.remove()
          end, { buffer = buffer, desc = 'Delete file/folder' })
          vim.keymap.set('n', 'y', function()
            api.fs.copy.relative_path()
          end, { buffer = buffer, desc = 'Copy relative file/folder path' })
          vim.keymap.set('n', 'H', function()
            api.tree.toggle_hidden_filter()
          end, { buffer = buffer, desc = 'Toggle hidden files/folders' })
          vim.keymap.set('n', 'a', function()
            api.fs.create()
          end, { buffer = buffer, desc = 'Create new file/folder' })
          vim.keymap.set('n', 'r', function()
            api.fs.rename()
            -- TODO: add LSP renaming
          end, { buffer = buffer, desc = 'Rename file/folder' })
        end,
        update_focused_file = {
          enable = true,
        },
        view = {
          width = 100,
        },
      })
    end,
  },
  -- TODO: configure
  {
    'stevearc/conform.nvim',
    event = 'BufEnter',
    config = function()
      require('conform').setup({
        format_on_save = function(buffer)
          return {
            timeout_ms = 1000,
          }
        end,
        notify_on_error = true,
        formatters_by_ft = {
          javascript = { { 'prettierd', 'prettier' } },
          lua = { 'stylua' },
          typescript = { { 'prettierd', 'prettier' } },
        },
      })
    end,
  },
  -- TODO: configure
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
          },
        })
      end, 100)
    end,
  },
}
