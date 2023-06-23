-- https://github.com/L3MON4D3/LuaSnip

return {
	"L3MON4D3/LuaSnip",
	version = "<CurrentMajor>.*",
	build = "make install_jsregexp",
	config = function()
		require("snip.config")
	end
}
