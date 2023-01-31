return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('telescope').setup({
      pickers = {
	find_files = {
	  theme = "dropdown",
	},
	git_branches = {
	  theme = "dropdown",
	},
	git_stash = {
	  theme = "dropdown",
	},
	git_status = {
	  theme = "dropdown",
	},
	live_grep = {
	  theme = "dropdown",
	},
	lsp_definitions = {
	  theme = "dropdown",
	},
	lsp_references = {
	  theme = "dropdown",
	},
	lsp_document_symbols = {
	  theme = "dropdown",
	},
      }
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
  end
}
