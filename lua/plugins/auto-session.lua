return {
    "rmagatti/auto-session",
    opts = {
        suppressed_dirs = { "~/", "~/Downloads", "~/Desktop/", "~/Documents" },
    },
    config = function()
        require("auto-session").setup({
            auto_restore = false,
        })

        vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
        vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
    end
}
