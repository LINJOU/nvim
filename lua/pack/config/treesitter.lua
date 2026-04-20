-- treesitter
local function treesitter() 

    local ensure_installed = {"lua", "typescript"}

    local ignore = { "oil" }

    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("nvim-treesitter-highlight", {clear = true}),
        callback = function(ev)
            local buf = ev.buf

            local ft = vim.bo[buf].filetype
            if ft == "" or vim.tbl_contains(ignore, ft) or vim.bo[buf].buftype ~= "" then
                return
            end

            local max_size = 100 * 1024
            local ok, status = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and status and status.size > max_size then
                return
            end

            local already_installed = require("nvim-treesitter.config").get_installed()

            local lang = vim.treesitter.language.get_lang(ft) or ft

            if not vim.tbl_contains(already_installed, lang) then
                local parsers_install = vim.iter(ensure_installed)
                :filter(function(parser)
                    return not vim.tbl_contains(already_installed, parser) and parser ~= lang
                end)
                :totable()

                table.insert(parsers_install, lang)
                require("nvim-treesitter").install(parsers_install)
            end

            pcall(vim.treesitter.start, buf, lang)

        end
    })

end

-- treesitter()
