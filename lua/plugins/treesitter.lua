-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow

local textobj = {
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["ac"] = "@class.outer",
			["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
		},
		selection_modes = {
			['@parameter.outer'] = 'v', -- charwise
			['@parameter.inner'] = 'v', -- charwise
			['@function.outer'] = 'V', -- linewise
			['@function.inner'] = 'V', -- linewise
			['@class.outer'] = '<c-v>', -- blockwise
		},
		include_surrounding_whitespace = true,
	},
}

local opts = {
	ensure_installed = { "lua", "vim", "css", "dockerfile", "html", "javascript", "json", "rust", "scss", "typescript",
		"vue", "tsx", "markdown" },
	textobjects = textobj,
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "<CR>",
			node_decremental = "<BS>",
		},
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extend_mode = true,
		max_file_line = nil,
	}
}

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "p00f/nvim-ts-rainbow" },
	},
	config = function()
		require("nvim-treesitter.configs").setup(opts)
	end
}
