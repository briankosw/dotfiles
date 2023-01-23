local status, packer = pcall(require, 'packer');
if (not status) then
  print('Packer is not installed')
  return
end

packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'kaicataldo/material.vim'

  -- UI
  use 'glepnir/dashboard-nvim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true
      })
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
      })
    end,
  }

  -- UX
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  }

  -- use {
  --   'numToStr/Comment.nvim',
  --   requires = {
  --     { 'JoosepAlviste/nvim-ts-context-commentstring' }
  --   },
  --   config = function()
  --     require('Comment').setup({
  --       pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  --     })
  --   end
  -- }


  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    }
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      }
    }
  }
end)

local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then
  print('lspconfig is not installed')
  return
end

lspconfig['tsserver'].setup({
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  end
})

local status, cmp = pcall(require, 'cmp')
if (not status) then
  print('cmp is not installed')
  return
end

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#no-snippet-plugin
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig['tsserver'].setup {
  capabilities = capabilities
}

local status, null_ls = pcall(require, 'null-ls')
if (not status) then
  print('null-ls is not installed')
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  }
})

local status, telescope = pcall(require, 'telescope')
if (not status) then
  print('telescope is not installed')
  return
end

telescope.setup({
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    git_branches = {
      theme = "dropdown"
    },
    git_stash = {
      theme = "dropdown"
    },
    live_grep = {
      theme = "dropdown"
    },
  }
})


local status, wk = pcall(require, 'which-key')
if (not status) then
  print('which-key is not installed')
  return
end

wk.register({
  ['<leader>'] = {
    c = { '<cmd>bd<cr>', 'Close current buffer' },
    e = { '<cmd>NvimTreeToggle<cr>', 'Toggle Nvim Tree' },
    f = { '<cmd>lua require("telescope.builtin").find_files()<cr>', 'Find files' },
    h = { '<cmd>noh<cr>', 'No highlight' },
    [';'] = { '<cmd>Dashboard<cr>', 'Open dashboard' },
  },
  ['<leader>g'] = {
    -- d = { '', 'Go to definition' },
  },
  ['<leader>s'] = {
    b = { '<cmd>lua require("telescope.builtin").git_branches()<cr>', 'Search git branches' },
    s = { '<cmd>lua require("telescope.builtin").git_stash()<cr>', 'Search git stashes' },
    t = { '<cmd>lua require("telescope.builtin").live_grep()<cr>', 'Search text' },
  },
})
