-- https://github.com/lewis6991/gitsigns.nvim

local opts = {}

return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup(opts)
	end
}
