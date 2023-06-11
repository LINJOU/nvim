-- https://github.com/famiu/feline.nvim

local everforest = {
	fg = "#D8D3BA",
	gray = "#7A8478",
	skyblue = "#7EBBB3",
	oceanblue = "#648e93",
	magenta = "#951c48",
	white = "#FFFFFF",
	green = "#93B259",
	yellow = "#DBBC7F",
	purple = "#DF69BA",
	orange = "#F57D26",
	red = "#F85552",
	aqua = "#35A77C",
	cyan = "#2c9678",
	blue = "#3A94C5",
	yellow_green = "#bec936",
	bg = "#555F66",
	bg1 = "#4D5960",
	bg2 = "#434F55",
	bg3 = "#3A464C",
	bg4 = "#333C43",
	bg5 = "#293136",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "purple",
	VISUAL = "blue",
	LINES = "oceanblue",
	BLOCK = "skyblue",
	REPLACE = "aqua",
	["V-REPLACE"] = "aqua",
	ENTER = "gray",
	MORE = "gray",
	SELECT = "red",
	COMMAND = "orange",
	SHELL = "cyan",
	TERM = "cyan",
	NONE = "gray",
}

local icons = {
	linux = "",
	macos = "",
	windows = "",
	err = "󰱯 ",
	warn = "󱕼 ",
	info = "󱈔 ",
	hint = "󰱲 ",
	lsp = " ",
	branch = " ",
	add = " ",
	remove = " ",
	change = " ",
	file = " ",
	col = ": ",
	readonly = "",
	noreadonly = "",
	position = " ",
}

local os_info = {
	UNIX = {
		provider = icons.linux,
		hl = {
			fg = "fg",
			bg = "bg2",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	MAC = {
		provider = icons.macos,
		hl = {
			fg = "gray",
			bg = "bg2",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	DOS = {
		provider = icons.windows,
		hl = {
			fg = "blue",
			bg = "bg2",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
}

local function get_os_info()
	local os = vim.bo.fileformat:upper()
	return os_info[os]
end

local function get_file_status()
	local readonly = vim.o.readonly
	local icon = ""
	local color = ""
	if readonly then
		icon = icons.readonly
		color = "red"
	else
		icon = icons.noreadonly
		color = "fg"
	end
	return icon, color
end

local function get_file_status_icon()
	local icon, _ = get_file_status()

	return icon
end

local function get_file_status_color()
	local _, color = get_file_status()

	return color
end

local function position()
	local _, col = unpack(vim.api.nvim_win_get_cursor(0))
	return string.format("%d", col + 1)
end

local comps = {
	vim_mode = {
		icon = "",
		provider = {
			name = "vi_mode",
		},
		hl = function()
			return {
				bg = require("feline.providers.vi_mode").get_mode_color(),
				style = "bold",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	git = {
		branch = {
			provider = "git_branch",
			icon = icons.branch,
			hl = {
				fg = "fb",
				bg = "magenta",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
		add = {
			provider = "git_diff_added",
			icon = icons.add,
			hl = {
				fg = "skyblue",
				bg = "bg3",
			},
			left_sep = "block",
			right_sep = "block",
		},
		remove = {
			provider = "git_diff_removed",
			icon = icons.remove,
			hl = {
				fg = "red",
				bg = "bg3",
			},
			right_sep = "block",
		},
		change = {
			provider = "git_diff_changed",
			icon = icons.change,
			hl = {
				fg = "cyan",
				bg = "bg3",
			},
			right_sep = "block",
		},
	},
	os = get_os_info(),
	lsp_client = {
		provider = "lsp_client_names",
		icon = "",
		hl = {
			fg = "oceanblue",
			bg = "bg1",
		},
		left_sep = "block",
		right_sep = "block",
	},
	diagnostic = {
		err = {
			provider = "diagnostic_errors",
			icon = icons.err,
			hl = {
				fg = "red",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
		warn = {
			provider = "diagnostic_warnings",
			icon = icons.warn,
			hl = {
				fg = "yellow",
				style = "bold",
			},
			right_sep = "block",
		},
		hint = {
			provider = "diagnostic_hints",
			icon = icons.hint,
			hl = {
				fg = "green",
				style = "bold",
			},
			right_sep = "block",
		},
		info = {
			provider = "diagnostic_info",
			icon = icons.info,
			hl = {
				fg = "cyan",
				style = "bold",
			},
			right_sep = "block",
		},
	},
	file = {
		type = {
			provider = {
				name = "file_type",
				opts = {
					case = "lowercase",
					filetype_icon = true,
				},
			},
			hl = {
				fg = "fg",
				bg = "bg4",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
		enc = {
			provider = "file_encoding",
			hl = {
				fg = "orange",
				bg = "bg3",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
		size = {
			provider = "file_size",
			icon = icons.file,
			hl = {
				fg = "yellow_green",
				bg = "bg4",
				style = "bold",
			},
			right_sep = "block",
		},
		status = {
			provider = get_file_status_icon(),
			hl = {
				fg = get_file_status_color(),
				bg = "green",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
	},
	position = {
		provider = position,
		icon = icons.col,
		hl = {
			fg = "aqua",
			bg = "bg5",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		icon = icons.position,
		hl = {
			fg = "blue",
			bg = "bg5",
			style = "bold",
		},
		right_sep = "block",
	},
}

local left = {
	comps.vim_mode,
	comps.git.branch,
	comps.git.add,
	comps.git.remove,
	comps.git.change,
}

local middle = {}

local right = {
	comps.diagnostic.err,
	comps.diagnostic.warn,
	comps.diagnostic.hint,
	comps.diagnostic.info,
	comps.os,
	comps.file.enc,
	comps.file.type,
	comps.file.size,
	comps.position,
	comps.line_percentage,
	comps.file.status,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

local opts = {
	components = components,
	theme = everforest,
	vi_mode_colors = vi_mode_colors,
}

return {
	"famiu/feline.nvim",
	branch = "0.5-compat",
	event = "VeryLazy",
	config = function()
		require("feline").setup(opts)
	end
}
