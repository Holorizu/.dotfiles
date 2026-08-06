return{
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = false,
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets"
		}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "clangd", "jdtls", "pyright", "html", "ts_ls", "cssls"},
			automatic_enable = true,
		},
		dependencies = {
				{ "mason-org/mason.nvim", opts = {} }
		}
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.lsp.config('lua_ls',{
				capabilities = capabilities
			})
			vim.lsp.config('html',{
				capabilities = capabilities
			})
			vim.lsp.config('jdtls',{
				capabilities = capabilities
			})
			vim.lsp.config('pyright',{
				capabilities = capabilities
			})
			vim.lsp.config('ts_ls',{
				capabilities = capabilities
			})
			vim.lsp.config('clangd',{
				capabilities = capabilities
			})
			vim.lsp.config('cssls',{
				capabilities = capabilities
			})
		end,
	}
}
