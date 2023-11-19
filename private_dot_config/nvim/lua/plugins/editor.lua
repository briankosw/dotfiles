return {
	{
		"dinhhuy258/git.nvim",
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = false,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"folke/which-key.nvim",
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
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
			require("which-key").register({
				["<leader>"] = {
					["<space>"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
				},
				["<leader>f"] = {
					f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
				},
				["<leader>s"] = {
					d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Go to definitions" },
					g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search text" },
					r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Go to references" },
				},
				["<leader>g"] = {
					b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Search git branches" },
					s = { "<cmd>lua require('telescope.builtin').git_stash()<cr>", "Search git stashes" },
					t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search text" },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					panel = {
						enabled = false,
						auto_refresh = false,
					},
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 75,
						keymap = {
							accept = "<C-space>",
							accept_word = false,
							accept_line = false,
						},
					},
				})
			end, 100)
		end,
	},
}
