-- https://github.com/nvim-tree/nvim-tree.lua

local opts = {
	renderer = {
		icons = {
			git_placement = "after"
		}
	},
	diagnostics = {
		enable = true,
	},
}

return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		}
	},
	config = function()
		require("nvim-tree").setup(opts)
	end
}
