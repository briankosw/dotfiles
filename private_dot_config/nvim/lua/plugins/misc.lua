return {
  {
    'aserowy/tmux.nvim',
    config = true,
  },
  -- TODO: configure
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
  -- TODO: configure
  {
    'folke/which-key.nvim',
    config = true,
  },
  -- TODO: configure
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
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
      alpha.setup(dashboard.opts)
    end,
  },
}
