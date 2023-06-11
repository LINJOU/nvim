-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

local opts = {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"cssls",
		"dockerls",
		"html",
		"tsserver",
		"tailwindcss",
		"volar",
		"jsonls",
		"emmet_ls",
	}
}

return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup(opts)
			require("lsp.config").setup()
		end
	},
}
