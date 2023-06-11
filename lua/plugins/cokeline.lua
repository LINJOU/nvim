-- https://github.com/willothy/nvim-cokeline

local colors = {
	fg_focused = "#D3C6AA",
	bg_focused = "#A7C080",
	fg_unfocused = "#9DA9A0",
	bg_unfocused = "#3C4841",
}

local opts = {
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and colors.fg_focused or colors.fg_unfocused
		end,
		bg = function(buffer)
			return buffer.is_focused and colors.bg_focused or colors.bg_unfocused
		end
	},
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = " 󰙅 NvimTree",
				fg = colors.fg_focused,
				bg = colors.bg_focused,
				style = "bold",
			},
		},
	},
	components = {
		{
			text = function(buffer)
				return " " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end
		},
		{
			text = function(buffer)
				return buffer.filename .. " "
			end
		}
	},
}

return {
	"willothy/nvim-cokeline",
	event = "VeryLazy",
	config = function()
		require("cokeline").setup(opts)
	end
}
