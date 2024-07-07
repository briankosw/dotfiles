return {
  {
    'j-hui/fidget.nvim',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')

      lspconfig.clangd.setup({})

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end,
  },
  -- TODO: configure
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    config = true,
    init = function()
      vim.keymap.set('n', '<leader>ci', '<cmd>TSToolsAddMissingImports<cr>', { desc = 'Add missing imports' })
      vim.keymap.set('n', '<leader>cu', '<cmd>TSToolsRemoveUnusedImports<cr>', { desc = 'Remove unused imports' })
    end,
  },
}
