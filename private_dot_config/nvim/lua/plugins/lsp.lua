return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local cmp = require("cmp")

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ bufnr = bufnr })
		end)

		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
		})

		require("lspconfig").tsserver.setup({})
	end,
}
