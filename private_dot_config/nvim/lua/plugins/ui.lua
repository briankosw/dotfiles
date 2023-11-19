return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/which-key.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}
			alpha.setup(dashboard.opts)
			require("which-key").register({
				["<leader>"] = {
					[";"] = { "<cmd>Alpha<cr>", "Toggle dashboard" },
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/which-key.nvim",
		},
		config = function()
			local api = require("nvim-tree.api")
			require("nvim-tree").setup({
				view = {
					width = 80,
				},
				on_attach = function(bufnr)
					vim.keymap.set("n", "l", function()
						api.node.open.edit()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "open a file or folder; root will cd to the above directory",
					})
					vim.keymap.set("n", "h", function()
						api.node.navigate.parent_close()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "close current open directory or parent",
					})
					vim.keymap.set("n", "v", function()
						api.node.open.vertical()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "open file in a vertical split",
					})
					vim.keymap.set("n", "s", function()
						api.node.open.horizontal()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "open file in a horizontal split",
					})
					vim.keymap.set("n", "d", function()
						api.fs.remove()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "open file in a horizontal split",
					})
					vim.keymap.set("n", "H", function()
						api.tree.toggle_hidden_filter()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "open file in a horizontal split",
					})
					vim.keymap.set("n", "y", function()
						api.fs.copy.relative_path()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "open file in a horizontal split",
					})
					vim.keymap.set("n", "a", function()
						api.fs.create()
					end, {
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
						desc = "Create new file or folder",
					})
				end,
			})
			require("which-key").register({
				["<leader>"] = {
					e = { "<cmd>NvimTreeToggle<cr>", "Toggle file explorer" },
				},
			})
		end,
	},
}
