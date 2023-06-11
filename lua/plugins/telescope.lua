-- https://github.com/nvim-telescope/telescope.nvim

local keymap = {
	-- find_files
	{"<leader>ff", ":Telescope find_files<CR>", desc = "find files"},
	-- find_grep
	{"<leader>fg", ":Telescope live_grep<CR>", desc = "find grep"},
	-- find buffers
	{"<leader>fb", ":Telescope buffers<CR>", desc = "find buffers"},
	-- resume
	{"<leader>rs", ":Telescope resume<CR>", desc = "resume"},
	-- file oldfiles
	{"<leader>fl", ":Telescope oldfiles<CR>", desc = "find oldfiles"},
}

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.1',
	dependencies = {'nvim-lua/plenary.nvim'},
	event = "VeryLazy",
	cmd = "Telescope",
	keys = keymap,
	config = function()
		require("telescope").setup()
	end
}
