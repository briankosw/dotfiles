return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      lspconfig = require('lspconfig')

      local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	print('tsserver successfully attached')
      end
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.tsserver.setup({
	on_attach = on_attach,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', },
	cmd = { 'typescript-language-server', '--stdio' },
	capabilities = capabilties,
	init_options = {
	  preferences = {
	    importModuleSpecifierPreference = 'non-relative',
	  }
	},
      })
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/nvim-cmp',
      'onsails/lspkind.nvim',
    },
    config = function()
      local lspkind = require('lspkind')
      local cmp = require('cmp')
      cmp.setup({
	mapping = {
	  ['<Enter>'] = cmp.mapping.confirm {
	    behavior = cmp.ConfirmBehavior.Insert,
	    select = true,
	  },
	  ['<C-j>'] = function(fallback)
	    if not cmp.select_next_item() then
              if vim.bo.buftype ~= 'prompt' and has_words_before() then
                cmp.complete()
	      else
                fallback()
              end
            end
          end,
	  ['<C-k>'] = function(fallback)
	    if not cmp.select_prev_item() then
              if vim.bo.buftype ~= 'prompt' and has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end
	  end,
	},
	formatting = {
	  format = lspkind.cmp_format(),
	},
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'buffer' },
	})
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
	      accept = '<C-Enter>',
	      accept_word = false,
	      accept_line = false,
	    },
	  }
	})
      end, 100)
    end
  },
}
