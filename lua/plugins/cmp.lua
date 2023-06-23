-- https://github.com/hrsh7th/nvim-cmp

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"f3fora/cmp-spell",
	},
	event = "VeryLazy",
	config = function()
		local t = function(str)
			return vim.api.nvim_replace_termcodes(str, true, true, true)
		end
		local cmp = require("cmp")
		local autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", autopairs.on_confirm_done())
		cmp.setup({
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping({
					c = function()
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						else
							cmp.complete()
						end
					end,
					i = function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
							vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
						else
							fallback()
						end
					end,
					s = function(fallback)
						if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
							vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
						else
							fallback()
						end
					end
				}),
				["<C-Tab>"] = cmp.mapping({
					c = function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							cmp.complete()
						end
					end,
					i = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
							return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
						else
							fallback()
						end
					end,
					s = function(fallback)
						if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
							return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), 'm', true)
						else
							fallback()
						end
					end
				}),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<leader><CR>'] = cmp.mapping.close(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			snippet = {
				expand = function(args)
					local luasnip = require("luasnip")
					if not luasnip then
						return
					end
					luasnip.lsp_expand(args.body)
				end
			},
			sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				},
				{
					name = 'spell',
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				}
			)
		})
		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'cmp_git' }
			}, {
				{ name = 'buffer' },
			})
		})
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			})
		})
	end,
}
