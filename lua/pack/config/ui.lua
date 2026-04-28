-- ui

-- colortheme
local function colorstheme_load()
	local colorstheme = require("everforest")
	colorstheme.setup({
		background = "soft",
		transparent_background_level = 2,
		colours_override = function(palette)
			palette.bg3 = "#9da9a0"
		end,
		on_highlights = function(hl, palette)
			hl.LineNr = { fg = palette.green }
			hl.FloatBorder = { fg = palette.green, bg = palette.none }
			hl.FloatTitle = { fg = palette.green, bg = palette.none }
			hl.NormalFloat = { bg = palette.none }
		end,
	})

	colorstheme.load()
end

local function indentscope_load()
	vim.api.nvim_create_autocmd("UIEnter", {

		group = vim.api.nvim_create_augroup("mini-indentscope", { clear = true }),
		callback = function()
			vim.schedule(function()
				require("mini.indentscope").setup({
					symbol = "│",
				})
				vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#a7c080" })
			end)
		end,
		desc = "load indentscope",
	})
end

colorstheme_load()
indentscope_load()
