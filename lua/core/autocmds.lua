local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- auto save
autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = "*",
	command = "silent! wall",
	nested = true,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query", -- :InspectTree
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"vim",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- auto remove new line comment
autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
	end,
})

-- auto indent
autocmd("BufWritePost", {
	pattern = "*",
	-- command = "normal! gg=G``"
	command = "lua vim.lsp.buf.format()"
})

-- wrap in text filetypes
autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- Opens PDF files in sioyek instead of viewing the binary in Neovim
autocmd("BufReadPost", {
	pattern = "*.pdf",
	callback = function()
		vim.fn.jobstart("sioyek '" .. vim.fn.expand("%") .. "'", { detach = true })
		vim.api.nvim_buf_delete(0, {})
	end,
	group = augroup("OpenPDF"),
	desc = "Opens PDF file in sioyek",
})
