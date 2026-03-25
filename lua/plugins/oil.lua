return{ 
    {
        "stevearc/oil.nvim",
        dependencies = { 
            { "nvim-mini/mini.icons" }
        },
        lazy = false,
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                },
                delete_to_trash = true,
                view_options = {
                    show_hidden = true
                },
                skip_confirm_for_simple_edits = true,
                keymaps = {
                    ["<C-c>"] = false,
                    ["q"] = { "actions.close", mode = "n" } 
                },
                float = {
                    border = "rounded"
                },
                ssh = {
                    border = "rounded"
                },
                keymaps_help = {
                    border = "rounded"
                }
            })
            
            vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "toggle float oil" })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "oil",
                callback = function()
                    vim.opt_local.cursorline = true
                end
            })

        end
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim"
    }
}
