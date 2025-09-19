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
    enabled = false,
  },
  {
    'aserowy/tmux.nvim',
    config = function()
      require('tmux').setup()
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      local utils = require('catppuccin.utils.colors')
      require('catppuccin').setup({
        flavour = 'mocha',
        highlight_overrides = {
          all = function(colors)
            return {
              -- Match the cursor line number background to cursor line (CursorLine) background.
              CursorLineNr = {
                bg = utils.vary_color(
                  { latte = utils.lighten(colors.mantle, 0.70, colors.base) },
                  utils.darken(colors.surface0, 0.64, colors.base)
                ),
              },
            }
          end,
        },
        integrations = {
          which_key = true,
        },
      })
      -- This must be called after setup.
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'dinhhuy258/git.nvim',
    config = true,
  },
  {
    'folke/snacks.nvim',
    opts = {
      dashboard = {
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
        },
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
  {
    'folke/which-key.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-mini/mini.icons',
    },
    keys = {
      { '<leader>bh', '<cmd>BufferLineCloseLeft<CR>' },
      { '<leader>bl', '<cmd>BufferLineCloseRight<CR>' },
      { '<leader>ci', '<cmd>TypescriptAddMissingImports<CR>' },
      { '<leader>d', '<cmd>bd<cr>' },
      { '<leader>e', '<cmd>NvimTreeToggle<cr>' },
      { '<leader>gO', '<cmd>Telescope git_status<cr>' },
      { '<leader>go', '<cmd>lua require("git.browse").open()<CR>' },
      { '<leader>h', '<cmd>noh<cr>' },
      { '<leader>lj', vim.diagnostic.goto_next, 'Go to next diagnostics' },
      { '<leader>lk', vim.diagnostic.goto_prev, 'Go to previous diagnostics' },
      { '<leader>lr', vim.lsp.buf.rename, 'Rename variable' },
      -- https://vimtricks.com/p/get-the-current-file-path/
      { '<leader>y', '<cmd>let @*=fnamemodify(expand("%"), ":~:.")<cr>' },
    },
  },
  {
    'LudoPinelli/comment-box.nvim',
  },
  -- TODO: configure
  {
    'nvim-lualine/lualine.nvim',
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
      local function live_grep_selection()
        local mode = vim.fn.mode()
        local text = ""

        if mode == 'v' or mode == 'V' then
          -- Get visually selected text
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.fn.getline(start_pos[2], end_pos[2])
          text = table.concat(lines, "\n")
        else
          -- Get word under cursor
          text = vim.fn.expand("<cword>")
        end

        require("telescope.builtin").live_grep({
          default_text = text,
        })
      end
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
      vim.keymap.set({'n', 'v'}, '<leader>sv', live_grep_selection, { desc = 'Live grep word/selection' })
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
}
