-- nvim-autopairs
local function autopairs()
    vim.api.nvim_create_autocmd("InsertEnter", {
        group = vim.api.nvim_create_augroup("nvim-autopairs", { clear = true }),
        pattern = "*",
        callback = function()
            local autopairs = require("nvim-autopairs")
    
            autopairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { "string" },
                    javascript = { "template_string" }
                }
            })
        end,
        desc = "autopairs"
    })
end

autopairs()

