-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lspconfig = require("lspconfig")

-- lua
local setupLua = function()
	lspconfig.lua_ls.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	}
end

-- rust
local setupRust = function()
	lspconfig.rust_analyzer.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		settings = {
			['rust-analyzer'] = {
				diagnostics = {
					enable = false,
				}
			}
		}
	}
end

-- css
-- npm i -g vscode-langservers-extracted
local setupCss = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lspconfig.cssls.setup {
		capabilities = capabilities,
	}
end

-- docker
local setupDocker = function()
	lspconfig.dockerls.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	}
end

-- html
-- npm i -g vscode-langservers-extracted
local setupHtml = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lspconfig.html.setup {
		capabilities = capabilities,
	}
end

-- js/ts
local setupJs = function()
	lspconfig.tsserver.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	}
end

-- tailwindcss
local setupTailwindcss = function()
	lspconfig.tailwindcss.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	}
end

-- vue
local setupVue = function()
	lspconfig.volar.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
	}
end

-- json
local setupJson = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lspconfig.jsonls.setup {
		capabilities = capabilities,
	}
end

-- markdowns
local setupMarkdown = function()
	lspconfig.marksman.setup {}
end

-- emmet-ls
local setupEmmet = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
			"typescriptreact", "vue" },
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true,
				},
			},
		}
	})
end

return {
	setup = function()
		setupLua()
		setupRust()
		setupCss()
		setupDocker()
		setupHtml()
		setupJs()
		setupTailwindcss()
		setupVue()
		setupJson()
		setupMarkdown()
		setupEmmet()
	end
}
