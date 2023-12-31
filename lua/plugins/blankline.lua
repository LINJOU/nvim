-- https://github.com/lukas-reineke/indent-blankline.nvim

local opts = {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}

return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		require("indent_blankline").setup(opts)
	end,
}
