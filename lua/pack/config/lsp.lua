-- lsp
local servers = {
	lua_ls = {
		settings = {
			["Lua"] = {
				hint = { enable = true },
				diagnostics = { globals = { "vim", "require", "opts", "PackUtils", "jit" } },
			},
		},
	},
	ts_ls = {},
	cssls = {},
}

local formatter = { "stylua" }

local function lsp_install_load()
	vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
		group = vim.api.nvim_create_augroup("lsp-server-install-load", { clear = true }),
		callback = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_extend("force", vim.tbl_keys(servers), formatter),
			})

			for server, conf in pairs(servers) do
				conf.capabilities = require("blink.cmp").get_lsp_capabilities(conf.capabilities)
				vim.lsp.config(server, conf)
				vim.lsp.enable(server)
			end
		end,
		desc = "auto install and load lsp server",
	})
end

local function lsp_attach()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-server-attach", { clear = true }),
		callback = function()
			vim.keymap.set(
				"n",
				"<leader>h",
				vim.lsp.buf.hover,
				{ noremap = true, silent = true, desc = "show prompt document" }
			)
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ noremap = true, silent = true, desc = "go to definition" }
			)
			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ noremap = true, silent = true, desc = "go to declaration" }
			)
			vim.keymap.set(
				"n",
				"gt",
				vim.lsp.buf.type_definition,
				{ noremap = true, silent = true, desc = "go to type definition" }
			)
			vim.keymap.set(
				"n",
				"<leader>rn",
				vim.lsp.buf.rename,
				{ noremap = true, silent = true, desc = "var rename" }
			)
			vim.keymap.set(
				"n",
				"<leader>d",
				vim.diagnostic.open_float,
				{ noremap = true, silent = true, desc = "float window show diagnostic info" }
			)
			vim.keymap.set(
				"n",
				"<leader>[",
				vim.diagnostic.goto_prev,
				{ noremap = true, silent = true, desc = "go to prev diagnostic info" }
			)
			vim.keymap.set(
				"n",
				"<leader>]",
				vim.diagnostic.goto_next,
				{ noremap = true, silent = true, desc = "go to next diagnostic info" }
			)

			vim.diagnostic.config({
				virtual_text = true,
				float = { severity_sort = true },
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰱯",
						[vim.diagnostic.severity.WARN] = "󱕼",
						[vim.diagnostic.severity.HINT] = "󰱫",
						[vim.diagnostic.severity.INFO] = "󰱸",
					},
				},
			})
		end,
		desc = "lsp server keymap and config",
	})
end

-- blink cmp
local function blink_cmp()
	local opts = {
		keymap = {
			preset = "none",
			["<s-tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<cr>"] = { "accept", "fallback" },
		},
		completion = {
			trigger = {
				show_on_trigger_character = true,
				show_on_blocked_trigger_characters = { " ", "\n", "\t" },
			},
			keyword = { range = "full" },
			menu = {
				min_width = 6,
				winhighlight = "Normal:None,FloatBorder:None,CursorLine:BlinkCmpMenuSelection,Search:None",
				border = "none",
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
				scrollbar = false,
			},
			documentation = {
				auto_show = true,
				window = {
					border = "none",
					scrollbar = false,
				},
			},
		},
		signature = {
			enabled = true,
			window = {
				border = "none",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = {
			prebuilt_binaries = {
				force_version = "v*",
			},
		},
		cmdline = {
			keymap = {
				["<cr>"] = { "select_and_accept", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	}

	vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
		once = true,
		callback = function()
			require("blink.cmp").setup(opts)
		end,
		desc = "load blink.cmp",
	})
end

lsp_install_load()
lsp_attach()
blink_cmp()
