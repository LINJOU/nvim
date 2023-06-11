-- https://github.com/jose-elias-alvarez/null-ls.nvim

return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.completion.spell,
				null_ls.builtins.completion.luasnip,
				null_ls.builtins.formatting.stylelint,
				null_ls.builtins.diagnostics.tidy,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.diagnostics.jsonlint,
			},
		})
	end,
}
