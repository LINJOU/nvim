-- https://github.com/neanias/everforest-nvim

local opts = {
	-- "soft", "medium" or "hard"
	background = "medium",
	transparent_background_level = 2,
	italics = false,
	disable_italic_comments = false,
}

return {
	"neanias/everforest-nvim",
	version =false,
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup(opts)
		vim.cmd("colorscheme everforest")
	end
}
