local opts = { noremap = true, silent = true }
local set = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- insert
set("i", "jk", "<ESC>")

-- normal
set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

set("n", "J", "mzJ`z", { desc = "cursor return to original position" })

set("n", "H", "^")
set("n", "L", "g_")

set("n", "n", "nzzzv", { desc = "go to next search result with cursor centered" })
set("n", "N", "Nzzzv", { desc = "go to prev search result with cursor centered" })

set("n", "Q", "<cmd>q!<CR>")
set("n", "q", "<cmd>wq<CR>")
set("n", "zz", "<cmd>wqa<CR>")

set("n", "P", "<cmd>pu<CR>")

set("n", "<leader>f", vim.lsp.buf.format)

set("n", "x", '"_x', opts)

set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word cursor is on globally" })

set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "close current tab" })
set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next" })
set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to prev" })
set("n", "<leader>tc", "<cmd>tabnew %<CR>", { desc = "open current tab in new tab" })

set("n", "s", "", { desc = "clean default keymap"})
set("n", "sv", "<C-w>v", { desc = "split window vertically" })
set("n", "sh", "<C-w>s", { desc = "split window horizontally" })
set("n", "se", "<C-w>=", { desc = "make splits equal size" })
set("n", "sd", "<cmd>close<CR>", { desc = "close current split" })

set("n", "<leader>h", "<C-w>h", { desc = "focus on the left window" })
set("n", "<leader>l", "<C-w>l", { desc = "focus on the right window" })
set("n", "<leader>k", "<C-w>k", { desc = "focus on the top window" })
set("n", "<leader>j", "<C-w>h", { desc = "focus on the bottom window" })

-- visual
set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "move lines down in visual selection" })
set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "move lines up in visual selection" })

set("v", "<", "<gv", opts)
set("v", ">", ">gv", opts)

set("v", "p", '"_dp', opts)
set("x", "<leader>p", [["_dp]])

set("v", "w", "iw", opts)

set("x", "H", "^")
set("x", "L", "g_")
