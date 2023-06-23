-- leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- insert
keymap.set("i", "jk", "<ESC>")

-- visual
-- 单行/多行移动
keymap.set("v", "K", ":m '>-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- 缩进
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- normal
-- 窗口
keymap.set("n", "s", "")
keymap.set("n", "sv", "<C-w>v")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "so", "<C-w>o")
keymap.set("n", "sc", "<C-w>c")

keymap.set("n", "s=", "<C-w>=")
keymap.set("n", "s[", ":vertical resize +10<CR>")
keymap.set("n", "s]", ":vertical resize -10<CR>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- 删除
-- 删除当前行之前内容
keymap.set("n", "<leader>ck", ":1,.-1d<CR>")
-- 删除当前行之后内容
keymap.set("n", "<leader>cj", ":.+1,$d<CR>")
-- 删除全部内容
keymap.set("n", "<leader>ca", ":%d<CR>")


-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>")

-- 快速滚动
keymap.set("n", "<C-u>", "8k")
keymap.set("n", "<C-d>", "8j")

-- 到行首/行尾
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- 到屏幕顶/底
keymap.set("n", "T", "H")
keymap.set("n", "B", "L")

-- 强制退出
keymap.set("n", "Q", ":q!<CR>")

-- 保存退出
keymap.set("n", "q", ":wq<CR>")

-- 移动屏幕行
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- 回退/前进
keymap.set("n", "<leader>[", "<C-o>")
keymap.set("n", "<leader>]", "<C-i>")

-- bufferline
keymap.set("n", "<leader>t", ":tabnew<CR>")
keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>")
keymap.set("n", "<leader>bc", ":Bdelate!<CR>")
keymap.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>")
keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>")
keymap.set("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>")

-- treesitter
keymap.set("n", "zc", ":foldclose<CR>")
keymap.set("n", "zz", ":foldopen<CR>")

-- lspconfig

-- nvim-tree
keymap.set("n", "tt", ":NvimTreeToggle<CR>")

-- symbols-outline
keymap.set("n", "<leader>so", ":SymbolsOutline<CR>")
