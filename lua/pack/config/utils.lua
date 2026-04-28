-- nvim-autopairs
local function autopairs_load()
	vim.api.nvim_create_autocmd("InsertEnter", {
		group = vim.api.nvim_create_augroup("nvim-autopairs", { clear = true }),
		once = true,
		callback = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
				},
			})
		end,
		desc = "load autopairs",
	})
end

-- flash
local function flash_load()
	local opts = {
		modes = {
			search = {
				enable = true,
			},
		},
	}

	vim.api.nvim_create_autocmd("VimEnter", {

		group = vim.api.nvim_create_augroup("nvim-flash", { clear = true }),
		callback = function()
			local flash = require("flash")

			vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { noremap = true, silent = true, desc = "flash" })
			vim.keymap.set({ "n", "x", "o" }, "S", function()
				flash.treesitter(opts)
			end, { noremap = true, silent = true, desc = "flash treesitter" })
		end,
		desc = "load flash",
	})
end

local function conform_load()
	local opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", stop_afrer_first = true },
		},
	}
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		pattern = "*",
		callback = function()
			require("conform").setup(opts)
		end,
	})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(ev)
			require("conform").format({ bufnr = ev.buf })
		end,
		desc = "load conform",
	})
end

local function ufo_load()
	vim.o.foldcolumn = "1"
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	vim.api.nvim_create_autocmd("UIEnter", {
		group = vim.api.nvim_create_augroup("show-ofu", { clear = true }),
		callback = function()
			local ufo = require("ufo")
			ufo.setup()

			vim.keymap.set("n", "zx", ufo.openAllFolds)
			vim.keymap.set("n", "zc", ufo.closeAllFolds)
		end,
	})
end

local function gitsigns_load()
	vim.api.nvim_create_autocmd("UIEnter", {
		group = vim.api.nvim_create_augroup("load-gitsigns", { clear = true }),
		callback = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				current_line_blame = true,
			})
			vim.keymap.set("n", "<leader>sd", gitsigns.diffthis, { silent = true, desc = "show diff" })
			vim.keymap.set("n", "gn", function()
				gitsigns.nav_hunk("next")
			end, { silent = true, desc = "go to next navigation" })
			vim.keymap.set("n", "gm", function()
				gitsigns.nav_hunk("prev")
			end, { silent = true, desc = "go to prev navigation" })
		end,
		desc = "load gitsigns",
	})
end

autopairs_load()
flash_load()
conform_load()
-- ufo_load()
gitsigns_load()
