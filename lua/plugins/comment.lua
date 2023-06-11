-- https://github.com/numToStr/Comment.nvim

local opts = {
	toggler = {
		line = "<leader>/",
		block = "<leader>.",
	}
}

return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup(opts)
	end
}
