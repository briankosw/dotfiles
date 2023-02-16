return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'folke/which-key.nvim',
  },
  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-n>'] = false,
            ['<C-p>'] = false,
          },
        },
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.9,
          },
        },
      },
    })
    require('which-key').register({
      ['<leader>'] = {
        f = { '<cmd>lua require("telescope.builtin").find_files()<cr>', 'Find files' },
      },
      ['<leader>g'] = {
        -- d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', 'Go to definition' },
        r = { '<cmd>lua require("telescope.builtin").lsp_references()<cr>', 'Go to references' },
      },
      ['<leader>s'] = {
        b = { '<cmd>lua require("telescope.builtin").git_branches()<cr>', 'Search git branches' },
        s = { '<cmd>lua require("telescope.builtin").git_stash()<cr>', 'Search git stashes' },
        t = { '<cmd>lua require("telescope.builtin").live_grep()<cr>', 'Search text' },
      },
    })
  end,
}
