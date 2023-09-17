return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP - core
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- LSP - helpers
      { 'jose-elias-alvarez/typescript.nvim' },
      -- autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})
      local lspconfig = require('lspconfig')
      -- Setup cmp configurations
      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }
      })
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)
      -- Setup LSP server configurations
      lsp.skip_server_setup({'tsserver'})
      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
      lsp.setup()
      require('typescript').setup({
        server = {
          init_options = {
            preferences = {
              autoImportFileExcludePatterns = {
                '@aws-sdk/client-textract'
              },
              quotePreference = 'single',
              importModuleSpecifierPreference = 'non-relative',
            },
          },
        },
      })
    end,
  },
}
