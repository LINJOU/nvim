return {
    "windwp/nvim-autopairs",
    dependencies = {
        "saghen/blink.compat",

        "saghen/blink.cmp",
    },
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" }
            }
        })

        require("blink.compat").load()
    end
}

