-- undotree
local function undotree()
	pcall(vim.cmd, "packadd nvim.undotree")

	vim.keymap.set("n", "<leader>u", function()
		require("undotree").open()
	end, { desc = "toggle undotree" })
end

-- yazi
local function yazi()
	vim.keymap.set({ "n", "x" }, "<leader>-", function()
		require("yazi").setup({
			keymaps = {
				open_file_in_vertical_split = "sv",
				open_file_in_horizontal_split = "sh",
				open_file_in_tab = "tn",
			},
		})
		pcall(vim.cmd, "Yazi")
	end, { desc = "open yazi" })
end

-- tv
local function television()
	local function load()
		local tv = require("tv")
		local h = tv.handlers
		tv.setup({
			channels = {
				files = {
					-- keybinding = ",;",
					handlers = {
						["<CR>"] = h.open_as_files,
						["<C-h>"] = h.open_in_split,
						["<C-v>"] = h.open_in_vsplit,
					},
				},
				text = {
					-- keybinding = ",.",
					handlers = {
						["<CR>"] = h.open_at_line,
						["<C-h>"] = h.open_in_split,
						["<C-v>"] = h.open_in_vsplit,
					},
				},
				cwd = {
					-- keybinding = ",l",
					handlers = {
						["<CR>"] = h.open_as_files,
						["<C-h>"] = h.open_in_split,
						["<C-v>"] = h.open_in_vsplit,
					},
				},
			},
		})
	end

	vim.keymap.set({ "n", "x" }, ",;", function()
		load()
		pcall(vim.cmd, "Tv files")
	end, { desc = "file sreach on current dir" })

	vim.keymap.set({ "n", "x" }, ",l", function()
		load()
		pcall(vim.cmd, "Tv cwd")
	end, { desc = "file sreach on current working dir" })

	vim.keymap.set({ "n", "x" }, ",.", function()
		load()
		pcall(vim.cmd, "Tv text")
	end, { desc = "string sreach on current file" })
end

undotree()
yazi()
television()
