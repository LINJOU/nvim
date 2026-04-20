-- lsp

local servers = {
    lua_ls = {
        settings = {
            ["Lua"] = {
                hint = { enable = true },
                diagnostics = { globals = { "vim", "require", "opts", "PackUtils", "jit" } },
            }
        }
    },
    ts_ls = {},
    cssls = {},
}

local function lsp_server_load()
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" },
        {
            group = vim.api.nvim_create_augroup("lsp-server-load-install", { clear = true }),
            pattern = "*",
            callback = function()
                require("mason").setup()
                require("mason-lspconfig").setup({
                    ensure_installed = vim.tbl_keys(servers)
                })

                vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover,
                    { noremap = true, silent = true, desc = "show prompt document" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition,
                    { noremap = true, silent = true, desc = "go to definition" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
                    { noremap = true, silent = true, desc = "go to declaration" })
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,
                    { noremap = true, silent = true, desc = "go to type definition" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
                    { noremap = true, silent = true, desc = "var rename" })
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,
                    { noremap = true, silent = true, desc = "float window show diagnostic info" })
                vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev,
                    { noremap = true, silent = true, desc = "go to prev diagnostic info" })
                vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next,
                    { noremap = true, silent = true, desc = "go to next diagnostic info" })

                for server, conf in pairs(servers) do
                    vim.lsp.config(server, conf)
                    vim.lsp.enable(server)
                end
            end
        }
    )
end

-- blink cmp
local function blink_cmp()

    vim.api.nvim_create_autocmd({"InsertEnter", "CmdlineEnter", "LspAttach"}, {
        once = true,
        pattern = "*",
        callback = function()
            require("blink.cmp").setup()
        end
    })

end

lsp_server_load()
blink_cmp()
