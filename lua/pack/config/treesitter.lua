-- treesitter

-- recheck filetype
local function recheck_filetype()
	vim.api.nvim_create_autocmd("BufEnter", {
		group = vim.api.nvim_create_augroup("recheck-filetype", { clear = true }),
		callback = function()
			if vim.bo.filetype == "" and vim.api.nvim_buf_get_name(0) ~= "" then
				pcall(vim.cmd, "filetype detect")
			end
		end,
		desc = "restart check filetype",
	})
end

-- treesitter auto install and load
local ignore = { "yazi", "blink-cmp-menu", "blink-cmp-documentation", "blink-cmp-signature", "Outline" }

local function treesitter_load()
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter-install-load", { clear = true }),
		callback = function(ev)
			local buf = ev.buf
			local ft = vim.bo[buf].filetype

			if ft == "" or vim.tbl_contains(ignore, ft) then
				return
			end

			vim.schedule(function()
				local ts = require("nvim-treesitter")
				local lang = vim.treesitter.language.get_lang(ft)
				if lang == "" then
					return
				end
				local installed = ts.get_installed()

				if not vim.tbl_contains(installed, lang) then
					ts.install({ lang })
				end

				ts.setup({
					indent = true,
				})
				pcall(vim.treesitter.start, buf, lang)
			end)
		end,
		desc = "auto install and load treesitter",
	})
end

recheck_filetype()
treesitter_load()
