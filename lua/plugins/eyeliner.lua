-- https://github.com/jinh0/eyeliner.nvim

return {
	"jinh0/eyeliner.nvim",
	event = "VeryLazy",
	config = function()
		require("eyeliner").setup({
			highlight_on_key = true,
			dim = false,
		})
	end
}
