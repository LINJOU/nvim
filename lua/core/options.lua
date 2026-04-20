vim.cmd("let g:netrw_banner = 0")

local o = vim.opt

o.guicursor = ""
o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.wrap = true

o.swapfile = false
o.backup = false
o.undofile = true

o.incsearch = true
o.inccommand = "split"
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

o.termguicolors = true
o.background = "dark"
o.scrolloff = 8
o.signcolumn = "yes"

o.splitright = true
o.splitbelow = true

o.backspace = {"start", "eol", "indent"}

o.isfname:append("@-@")
o.clipboard:append("unnamedplus")

o.updatetime = 60

o.mouse = "a"

o.timeoutlen = 400

o.list = true
o.listchars = "tab:|-,space:·,trail:."

vim.g.editorconfig = true
