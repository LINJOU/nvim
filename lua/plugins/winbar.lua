-- https://github.com/fgheng/winbar.nvim

local opts = {
	enabled = true,
	show_file_path = true,
	show_symbols = true,

	colors = {
		path = '',
		file_name = '',
		symbols = '',
	},

	icons = {
		file_icon_default = '',
		seperator = '>',
		editor_state = '●',
		lock_icon = '',
	},

	exclude_filetype = {
		'help',
		'startify',
		'dashboard',
		'neogitstatus',
		'NvimTree',
		'Trouble',
		'lir',
		'Outline',
		'spectre_panel',
		'toggleterm',
		'qf',
	}
}

return {
	"fgheng/winbar.nvim",
	event = "VeryLazy",
	config = function()
		require("winbar").setup(opts)
	end
}
