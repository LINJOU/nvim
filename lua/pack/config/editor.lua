-- oil
local function oil()
    local oil = require("oil")

    oil.setup({
        columns = { "icon", "mtime", "size" },
        delete_to_trash = true,
        view_options = { show_hidden = true },
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ["<C-c>"] = false,
            ["q"] = { "actions.close", mode = "n" },
            ["sv"] = { "actions.select", opts = { vertical = true } },
            ["sh"] = { "actions.select", opts = { horizontal = true } },
        },
        float = { border = "rounded" },
        ssh = { border = "rounded" },
        keymaps_help = { border = "rounded" }
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "oil",
        group = vim.api.nvim_create_augroup("oil-cursorline", { clear = true }),
        callback = function()
            vim.opt_local.cursorline = true
        end
    })

    vim.keymap.set("n", "<leader>-", oil.toggle_float, { desc = "toggle float oil" })
end

-- undotree
local function undotree()
    vim.cmd("packadd nvim.undotree")
    vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "toggle undotree" })
end

oil()
undotree()
