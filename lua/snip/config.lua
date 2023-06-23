-- https://github.com/L3MON4D3/LuaSnip
local ls = require("luasnip")
local types = require("luasnip.util.types")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			}
		}
	}
})

-- expansion key <c-k>
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- jump backwords key <c-j>
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- selecting within a list of options <c-l>
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- markdown
ls.add_snippets("markdown", {
	s("h1", fmt("# {}", i(1))),
	s("h2", fmt("## {}", i(1))),
	s("h3", fmt("### {}", i(1))),
	s("h4", fmt("##### {}", i(1))),
	s("h5", fmt("##### {}", i(1))),
	s("h6", fmt("###### {}", i(1))),
	s("jsc", fmt("```javascript\n{}\n```", i(1))),
})

-- javascript
ls.add_snippets("javascript", {
	s("cl", fmt("console.log({});", i(1)))
})
