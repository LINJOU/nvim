local set = vim.o
local indet = 4

-- 行号
set.number = true
set.relativenumber = true
set.numberwidth = 2

-- 高亮行保持在视口中央
set.scrolloff = 10

-- 缩进
set.tabstop = indet
set.shiftwidth = indet
set.softtabstop = indet
set.shiftround = true

-- 对齐
set.autoindent = true
set.smartindent = true

-- 文本过长拆行
set.wrap = true

-- 高亮光标行
set.cursorline = true

-- 显示左侧1图标指示列
set.signcolumn = "yes"

-- 搜索
set.ignorecase = true
set.smartcase = true
set.incsearch = true

-- 外部修改文件，自动加载
set.autoread = true

-- 支持鼠标
set.mouse = "a"

-- 行尾可跳到下一行
set.whichwrap = "b,s,<,>,[,],h,l"

-- 禁止创建备份文件
set.backup = false

-- 更新到磁盘
set.updatetime = 100

-- 等待mappings
set.timeoutlen = 400

-- split window
set.splitbelow = true
set.splitright = true

-- 自动补全不自动选中
set.completeopt = "longest,menuone,noselect,noinsert,preview"

-- 补全增强
set.wildmenu = true

-- 样式
set.termguicolors = true

-- 不可见字符的显示
set.list = true
set.listchars = "tab:>-,space:·,trail:."

-- 文件信息
set.shortmess = set.shortmess .. 'c'

-- 显示标签
set.showtabline = 2

-- 不显示当前模式
set.showmode = false

-- 系统剪贴板
set.clipboard = "unnamedplus"

-- 自动写入到文件
set.autowrite = true

-- 拼写检查
set.spell = true
set.spelloptions = "camel"
