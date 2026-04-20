-- vim.print(vim.pack.get({"nvim-autopairs"}))
local install_list = {}

local plugin_list = {
    -- pubilc
    pubilc = {
        "https://github.com/nvim-lua/plenary.nvim",
    },
    ui = {
        "https://github.com/nvim-tree/nvim-web-devicons",
        "https://github.com/neanias/everforest-nvim",
    },
    editor = {
        "https://github.com/stevearc/oil.nvim",
    },
    treesitter = {
        "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    lsp = {
        "https://github.com/rafamadriz/friendly-snippets",
        "https://github.com/saghen/blink.cmp",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/mason-org/mason-lspconfig.nvim"
    },
    utils = {
        "https://github.com/windwp/nvim-autopairs",
    }
}

local function get_spec_name(spec)
    local url = type(spec) == "table" and spec.src or spec
    return url:match("([^/]+)$")
end

for _, group in pairs(plugin_list) do
    vim.list_extend(install_list, group)
end

-- clean orphaned plugins
vim.api.nvim_create_user_command("PmC", function()

    local specs = {}

    if #install_list == 0 then return end

    for _, plugin in ipairs(install_list) do
        table.insert(specs, get_spec_name(plugin))
    end

    local pack_dir = vim.fn.stdpath("data") .. "/site/pack/core/opt"
    local pkgs = vim.fn.expand(pack_dir .. "/*", false, true)

    if #pkgs == 0 then return end
-- 
    local del_list = vim.iter(pkgs)
        :map(function(pkg)
            return vim.fn.fnamemodify(pkg, ":t")
        end)
        :filter(function(pkg)
            return not vim.tbl_contains(specs, pkg)
        end):totable()

      if #del_list > 0 then
          vim.schedule(function()
              vim.pack.del(del_list)
          end)
      end

end, {
    nargs = "*",
    desc = "Clean Up Orphaned Plugins"
})

-- update plugins
vim.api.nvim_create_user_command("PmU", function()
    vim.pack.update()
end, {
    nargs = "*",
    desc = "Update Plugins"
})

vim.api.nvim_create_autocmd("PackChanged", {
    pattern = "*",
    callback = function(ev)
        if ev.data.kind == "delete" then
            vim.notify("Clean Up Orphaned Plugin: " .. ev.data.spec.name, vim.log.levels.INFO)
        end
    end
})

vim.pack.add(install_list)

require("pack.config.ui")
require("pack.config.editor")
require("pack.config.treesitter")
require("pack.config.lsp")
require("pack.config.utils")
