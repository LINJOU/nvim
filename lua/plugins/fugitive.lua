-- https://github.com/tpope/vim-fugitive

return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	cmd = "Git",
	config = function()
		vim.cmd.cnoreabbrev([[git Git]])
	end
}
