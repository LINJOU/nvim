return {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
        require("everforest").setup({
            background = "soft",
            transparent_background_level = 2,
            on_highlights = function(hl, palette)
                hl.LineNr = { fg = palette.green }
                hl.FloatBorder = { fg = palette.green, bg = palette.none }
                hl.FloatTitle = { fg = palette.green, bg = palette.none }
                hl.NormalFloat = { bg = palette.none }
            end
        })

        require("everforest").load()
    end,
}
