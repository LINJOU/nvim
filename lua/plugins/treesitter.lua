return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "python",
                "http",
                "prisma",
                "markdown", 
                "markdown_inline",
                "graphql",
                "bash",
                "fish",
                "lua",
                "vim",
                "rust",
                "dockerfile",
                "gitignore",
                "vimdoc",
                "vue",
            }
        },
        config = function(_, opts)
            local treesitter = require("nvim-treesitter")
            treesitter.setup({
                install_dir = vim.fn.stdpath('data') .. '/site'
            })
            treesitter.install(opts.ensure_installed)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "<filetype>" },
                callback = function()
                    vim.treesitter.start()
                end
            })
        end
    }
}
